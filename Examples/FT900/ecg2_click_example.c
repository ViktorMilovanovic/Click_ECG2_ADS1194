#include "ecg2_hal.h"
#include "ecg2_hw.h"

// specific ADC constants
const num_bytes_sample = 19;        // number of bytes in ADS1194 sample in data continuous mode
const double channel_gain = 20.00;  // amplifier gain
const double vref = 2400.00;        // reference voltage in millivolts

// ADS1194 pins
sbit ECG2_CS    at   GPIO_PIN28_bit;
sbit ECG2_DRDY  at   GPIO_PIN3_bit;          // DRDY# pin, active low when conversion data is ready
sbit ECG2_PWDN  at   GPIO_PIN56_bit;         // PWDN is power down pin, when low ECG chip is in power down mode, this pin must be high for exit power down mode
sbit ECG2_RESET at   GPIO_PIN1_bit;          // pull RESET pin low to reset ECG2
sbit ECG2_PACE  at   GPIO_PIN9_bit;          // analog input for pulse detect


// variable for ADC
unsigned char ecg_data_sample[num_bytes_sample];  // one sample data from ADS1194
double channel1_voltage; // channel 1 millivolts
double channel2_voltage; // channel 2 millivolts
double channel3_voltage; // channel 3 millivolts
double channel4_voltage; // channel 4 millivolts
double channel1_voltage_offset; // channel 1 offset millivolts
double channel2_voltage_offset; // channel 2 offset millivolts
double channel3_voltage_offset; // channel 3 offset millivolts
double channel4_voltage_offset; // channel 4 offset millivolts

 /**
 * @brief calculate_ecg_channel
 * - Calculates the specific channel voltage in milivolts
 * @param buffer
 * - Buffer with the data samples from the ECG2 click
 * @param index
 * - Index of the buffer where the value is stored
 * @param refv
 * - Reference voltage in milivolts
 * @param gain
 * - Channel gain
 * @param offset_voltage
 * - Channel voltage offset
 * @return
 * - channel voltage in milivolts
 */
double calculate_ecg_channel( unsigned char *buffer, unsigned short index, double refv, double gain, double offset_voltage )
{
    int adc_value = 0;
    adc_value = 0;
    adc_value = buffer[index];
    adc_value <<= 8;
    adc_value |= buffer[index + 1];
    return ( ((double)adc_value * (refV / (32768 - 1))) / gain ) - offset_voltage;
}


void setup_ecg2()
{
    uint8_t tempread, tempctr;
    ecg2_oscillator_clock_enable(true);
    ecg2_set_output_data_rate(SPS_125);
    //no test signal, default value
    ecg2_set_test_source(TEST_SOURCE_EXTERNAL);
    // RDL internal and enabled, reference voltage is 2.4V, RLD signal source is internal
    ecg2_power_down_reference_buffer_enable(true);
    ecg2_set_reference_voltage(vref_2_4V);
    ecg2_rld_measurement_enable(true);
    ecg2_rldref_source_select(RLDEF_SIGNAL_INTERNAL);
    ecg2_rld_buffer_enable(true);
    // lead-off is in DC mode and using pull up and down resistors, comparator thresholds are set to 70% and 30%
    ecg2_lead_off_comparator_threshold_set(POSITIVE_70);
    ecg2_vlead_off_enable(false);
    ecg2_ilead_off_magnitude_set(NA_4);
    ecg2_flead_off_frequency_set(3);

    // channel is on and gain is 12, input shorted for offset measurements
    ecg2_configure_channel(1, false, 0, 1);

    // channel is on and gain is 12, input shorted for offset measurements
    ecg2_configure_channel(2, false, 0, 1);

    // channel is on and gain is 12, input shorted for offset measurements
    ecg2_configure_channel(3, false, 0, 1);
    // channel is on and gain is 12, input shorted for offset measurements
    ecg2_configure_channel(4, false, 0, 1);
    // channels 2 is used for RDL
    ecg2_right_leg_positive_drive_set(2);
    // channels 2 is used for RDL
    ecg2_right_leg_negative_drive_set(2);
    // channel 3P uses pull-up resistor to detect LL lead-off, channel 1P uses pull-up resistor to detect LA lead-off
    ecg2_lead_off_positive_channel_select(5);
    // channel 2N uses pull-down resistor to detect RA lead-off
    ecg2_lead_off_negative_channel_select(2);
    // no flip
    ecg2_lead_off_current_direction_select(0);
    // continuous conversion mode, WCT not connected to RLD, LOFF comparators enabled
    ecg2_lead_off_comparator_enable(true);
    // activate conversion to read and calculate offset
    ecg2_hal_send_command(START_COMMAND); // send START command
    Delay_us(100);
    ecg2_hal_send_command(RDATA_COMMAND); // enable read data once
    ECG2_CS = 0; // chip select
    Delay_us(1);

    while (ECG2_DRDY) {} // Wait for ADS1194 device to prepare output data.
    Delay_us(5);
    for (tempctr = 0; tempctr < num_bytes_sample; tempctr++) { ecg_data_sample[tempctr] = SPIM_Read(0); } // read ADS1194 output data, one sample
    // calculate offset
    // offset voltage LA RA
    channel1_voltage_offset = calculate_ecg_channel( ecg_data_sample, 3, vref, channel_gain, 0 );
    // offset voltage LL RA
    channel2_voltage_offset = calculate_ecg_channel( ecg_data_sample, 5, vref, channel_gain, 0 );
    // offset voltage LL LA
    channel3_voltage_offset = calculate_ecg_channel( ecg_data_sample, 7, vref, channel_gain, 0 );
    // offset voltage
    channel4_voltage_offset = calculate_ecg_channel( ecg_data_sample, 9, vref, channel_gain, 0 );
    ECG2_CS = 1;
    Delay_us(10);

    // stop conversion for offset
    ecg2_hal_send_command(STOP_COMMAND); // send STOP command
    Delay_us(100);
    ecg2_hal_send_command(SDATAC_COMMAND); // SDATAC mode
    // activate conversion

    // channel 1 settings register
    // channel is on and gain is 12, normal electrode input
    ecg2_configure_channel(1, false, 6, 0);
    // channel 2 settings register
    // channel is on and gain is 12, normal electrode input
    ecg2_configure_channel(2, false, 6, 0);
    // channel 3 settings register
    // channel is on and gain is 12, normal electrode input
    ecg2_configure_channel(3, false, 6, 0);
    // channel 4 settings register
    // channel is on and gain is 12, temperature sensor
    ecg2_configure_channel(4, false, 6, 4);
    ecg2_hal_send_command(START_COMMAND); // send START command
    Delay_us(100);
    ecg2_hal_send_command(RDATAC_COMMAND); // enable read data in continuous mode

    ECG2_CS = 0; // chip select
    Delay_us(1);

}

void main()
{
    uint16_t i = 0;
    double time_value = 0.0;
    char timer_read_string[10];
    char final_string [20];
    GPIO_Digital_Input( &GPIO_PORT_00_07, _GPIO_PINMASK_3 );  // pin DRDY is input
    GPIO_Digital_Output(&GPIO_PORT_56_63, _GPIO_PINMASK_0 );  // pin PWDN is output
    ECG2_PWDN = 1;                                            // ECG chip is powered up
    GPIO_Digital_Output( &GPIO_PORT_24_31, _GPIO_PINMASK_4 ); // pin CS is output
    ECG2_CS = 1;                                              // deselect ECG2 click
    GPIO_Digital_Output( &GPIO_PORT_00_07, _GPIO_PINMASK_1 ); // pin RESET is output
    ECG2_RESET = 1;                                           // pull RESET bit low for 18 CLK for RESET ECG device

    UART1_Init(57600);
    delay_ms(300);
    Uart_Write_Text("Uart init\r\n");

    SPIM1_Init_Advanced( _SPI_MASTER_CLK_RATIO_64, _SPI_CFG_PHASE_CAPTURE_RISING |
                         _SPI_CFG_POLARITY_IDLE_LOW | _SPI_CFG_SS_AUTO_DISABLE |
                         _SPI_CFG_FIFO_DISABLE, _SPI_SS_LINE_NONE );
    delay_ms(300);

    ecg2_hal_init();

    // issue RESET pulse
    ECG2_RESET = 0;
    Delay_us(100);
    ECG2_RESET = 1;

    Delay_ms(1000);

    // device is in RDATAC mode, set it to SDATAC mode to edit registers
    ecg2_hal_send_Command(SDATAC_COMMAND);

    Delay_ms(1000);

    setup_ecg2();
    Uart_Write_Text("START\r\n");
    while (1)
    {

        while (ECG2_DRDY) {} // Wait for ADS1194 device to prepare output data. Data is ready every 8 milliseconds
        Delay_us(5);
        for (i = 0; i < num_bytes_sample; i++)
            ecg_data_sample[i] = SPIM_Read(0); // read ADS1194 output data, one sample


        time_value += 8.0;                     // increment the time value
        // calculate input voltage
        // voltage LA RA
        channel1_voltage = calculate_ecg_channel( ecg_data_sample, 3, vref, channel_gain, channel1_voltage_offset );
        // voltage LL RA - channel 2 is usually used for simple ECG
        channel2_voltage = calculate_ecg_channel( ecg_data_sample, 5, vref, channel_gain, channel2_voltage_offset );
        sprintf(final_string, "%.2f", channel2_voltage);     // convert values to string and send to MikroPlot
        strcat(final_string, ",");
        sprintf(timer_read_string, "%.2f", time_value);
        strcat(final_string, timer_read_string);
        Uart_Write_Text(final_string);
        Uart_Write_Text("\r\n");

        // voltage LL LA
        channel3_voltage = calculate_ecg_channel( ecg_data_sample, 7, vref, channel_gain, channel3_voltage_offset );
        // voltage from temperature sensor
        channel4_voltage = calculate_ecg_channel( ecg_data_sample, 9, vref, channel_gain, channel4_voltage_offset );
    }
}