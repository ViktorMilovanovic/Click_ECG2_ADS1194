#include "ecg2_hal.h"
#include "ecg2_hw.h"


void register_bit_set(uint8_t reg, uint8_t bit_num, uint8_t val)
{
    uint8_t tempbuff;

    ecg2_hal_read_bytes(reg, &tempbuff, 1);
    if (val == 1)
        tempbuff |= 1 << bit_num;
    else if (val == 0)
        tempbuff &= ~(1 << bit_num);
    ecg2_hal_write_bytes(reg, &tempbuff, 1);
}

uint8_t ecg2_get_device_id()
{
    uint8_t tempbuff;
    ecg2_hal_read_bytes(ID_REG, &tempbuff, 1);
    return tempbuff;
}

void ecg2_daisy_chain_enable(bool enable)
{
    if (enable)
        register_bit_set(CONFIG1_REG, 6, 0);
    else
        register_bit_set(CONFIG1_REG, 6, 1);
}

void ecg2_oscillator_clock_enable ( bool enable )
{

    if (enable)
        register_bit_set(CONFIG1_REG, 5, 0);
    else
        register_bit_set(CONFIG1_REG, 5, 1);
}


int8_t ecg2_set_output_data_rate(output_data_rate_t output_data_rate)
{
    uint8_t tempbuff = 0;
    if (output_data_rate > 7)
        return  -1;

    ecg2_hal_read_bytes(CONFIG1_REG, &tempbuff, 1);
    tempbuff &= ~(7);

    tempbuff |= output_data_rate;
    ecg2_hal_write_bytes(CONFIG1_REG, &tempbuff, 1);
    return 0;
}

int8_t ecg2_set_test_source(test_source_t test_source)
{
    if ( test_source > 1)
        return -1;

    else
        register_bit_set(CONFIG2_REG, 4, test_source);

    return 0;
}

int8_t ecg2_set_test_amplitude (test_amplitude_t amplitutde)
{
    if (amplitutde > 1)
        return -1;
    else
        register_bit_set(CONFIG2_REG, 2, 1);

    return 0;
}


int8_t ecg2_set_test_frequency (test_frequency_t frequency)
{
    uint8_t tempbuff = 0;
    if (frequency > 3)
        return -1;

    ecg2_hal_read_bytes(CONFIG2_REG, &tempbuff, 1);

    tempbuff &= ~(3);
    tempbuff |= frequency;
    ecg2_hal_write_bytes(CONFIG2_REG, &tempbuff, 1);
    return 0;
}

void ecg2_power_down_reference_buffer_enable(bool enable)
{
    if (enable)
        register_bit_set(CONFIG3_REG, 7, 1);
    else
        register_bit_set(CONFIG3_REG, 7, 0);
}

int8_t ecg2_set_reference_voltage(reference_voltage_t refvol)
{
    if (refvol > 1)
        return -1;

    else
        register_bit_set(CONFIG3_REG, 5, refvol);
}

void ecg2_rld_measurement_enable( bool enable )
{
    if (enable)
        register_bit_set(CONFIG3_REG, 4, 0);
    else
        register_bit_set(CONFIG3_REG, 4, 0);
}

int8_t ecg2_rldref_source_select(rldef_signal_t source)
{
    if (source > 1)
        return -1;
    else
        register_bit_set(CONFIG3_REG, 3, source);
}

void ecg2_rld_buffer_enable (bool enable)
{
    if (enable)
        register_bit_set(CONFIG3_REG, 2, 1);
    else
       register_bit_set(CONFIG3_REG, 2, 0);
}

int8_t ecg2_rld_sense_enable(bool enable)
{
    if (enable)
        register_bit_set(CONFIG3_REG, 1, 1);
    else
       register_bit_set(CONFIG3_REG, 1, 0);
}

uint8_t ecg2_rld_get_status ()
{
    uint8_t tempbuff = 0;
    ecg2_hal_read_bytes(CONFIG3_REG, &tempbuff, 1);
    return (tempbuff & 1);
}

int8_t ecg2_lead_off_comparator_threshold_set(lead_off_threshold_t threshold)
{
    uint8_t tempbuf = 0;
    if (threshold > 7)
        return -1;

    ecg2_hal_read_bytes(LOFF_REG, &tempbuf, 1);
    tempbuf &= ~(7 << 5);
    tempbuf |= threshold << 5;
    ecg2_hal_write_bytes(LOFF_REG, &tempbuf, 1);
    return 0;
}

void ecg2_vlead_off_enable(bool enable)
{
    if (enable)
        register_bit_set(LOFF_REG, 4, 0);
    else
        register_bit_set(LOFF_REG, 4, 1);
}

int8_t ecg2_ilead_off_magnitude_set (ilead_off_magnitude_t set)
{
    uint8_t tempbuf = 0;
    if (set > 3)
        return -1;

    ecg2_hal_read_bytes(LOFF_REG, &tempbuf, 1);
    tempbuf &= ~(3 << 2);
    tempbuf |= set << 2;
    ecg2_hal_write_bytes(LOFF_REG, &tempbuf, 1);
}

int8_t ecg2_flead_off_frequency_set (uint8_t set)
{
    uint8_t tempbuf = 0;
    if (set > 3 )
        return -1;
    ecg2_hal_read_bytes(LOFF_REG, &tempbuf, 1);
    tempbuf &= ~ 3;
    tempbuf |= set;
    ecg2_hal_write_bytes(LOFF_REG, &tempbuf, 1);
}

int8_t ecg2_configure_channel (uint8_t channel, bool power_down, uint8_t pga_gain, uint8_t channel_input)
{
    uint8_t tempbuff = 0;

    switch (channel)
    {
    case 1:
        if (pga_gain > 7)
            return -1;

        if ( channel_input > 7 )
            return -1;

        tempbuff |= pga_gain << 4;
        tempbuff |= channel_input;
        if (power_down)
            tempbuff |= 1 << 7;
        else
            tempbuff &= ~(1 << 7);

        ecg2_hal_write_bytes(CH1SET_REG, &tempbuff, 1);
        return 0;

    case 2:
        if (pga_gain > 15)
            return -1;

        if ( channel_input > 15 )
            return -1;

        if (power_down)
            tempbuff |= 1 << 7;
        else
            tempbuff &= ~(1 << 7);

        tempbuff |= pga_gain << 4;
        tempbuff |= channel_input;
        ecg2_hal_write_bytes(CH2SET_REG, &tempbuff, 1);
        return 0;

    case 3:
        if (pga_gain > 15)
            return -1;

        if ( channel_input > 15 )
            return -1;

        if (power_down)
            tempbuff |= 1 << 7;
        else
            tempbuff &= ~(1 << 7);

        tempbuff |= pga_gain << 4;
        tempbuff |= channel_input;
        ecg2_hal_write_bytes(CH3SET_REG, &tempbuff, 1);
        return 0;

    case 4:
        if (pga_gain > 15)
            return -1;

        if ( channel_input > 15 )
            return -1;

        if (power_down)
            tempbuff |= 1 << 7;
        else
            tempbuff &= ~(1 << 7);

        tempbuff |= pga_gain << 4;
        tempbuff |= channel_input;
        ecg2_hal_write_bytes(CH4SET_REG, &tempbuff, 1);
        return 0;
    case 5:
        if (pga_gain > 15)
            return -1;

        if ( channel_input > 15 )
            return -1;

        if (power_down)
            tempbuff |= 1 << 7;
        else
            tempbuff &= ~(1 << 7);

        tempbuff |= pga_gain << 4;
        tempbuff |= channel_input;
        ecg2_hal_write_bytes(CH5SET_REG, &tempbuff, 1);
        return 0;

    case 6:
        if (pga_gain > 15)
            return -1;

        if ( channel_input > 15 )
            return -1;

        if (power_down)
            tempbuff |= 1 << 7;
        else
            tempbuff &= ~(1 << 7);

        tempbuff |= pga_gain << 4;
        tempbuff |= channel_input;
        ecg2_hal_write_bytes(CH6SET_REG, &tempbuff, 1);
        return 0;

    case 7:
        if (pga_gain > 15)
            return -1;

        if ( channel_input > 15 )
            return -1;

        if (power_down)
            tempbuff |= 1 << 7;
        else
            tempbuff &= ~(1 << 7);

        tempbuff |= pga_gain << 4;
        tempbuff |= channel_input;
        ecg2_hal_write_bytes(CH7SET_REG, &tempbuff, 1);
        return 0;

    case 8:
        if (pga_gain > 15)
            return -1;

        if ( channel_input > 15 )
            return -1;

        if (power_down)
            tempbuff |= 1 << 7;
        else
            tempbuff &= ~(1 << 7);

        tempbuff |= pga_gain << 4;
        tempbuff |= channel_input;
        ecg2_hal_write_bytes(CH8SET_REG, &tempbuff, 1);
        return 0;

    default:
        return -1;
    }
}

void ecg2_right_leg_positive_drive_set(uint8_t set)
{
    uint8_t tempbuff = set;
    ecg2_hal_write_bytes(RLD_SENSP_REG, &tempbuff, 1);
}

void ecg2_right_leg_negative_drive_set(uint8_t set)
{
    uint8_t tempbuff = set;
    ecg2_hal_write_bytes(RLD_SENSN_REG, &tempbuff, 1);
}

void ecg2_lead_off_positive_channel_select (uint8_t set)
{
    uint8_t tempbuff = set;
    ecg2_hal_write_bytes(LOFF_SENSP_REG, &tempbuff, 1);
}

void ecg2_lead_off_negative_channel_select (uint8_t set)
{
    uint8_t tempbuff = set;
    ecg2_hal_write_bytes(LOFF_SENSN_REG, &tempbuff, 1);
}

void ecg2_lead_off_current_direction_select (uint8_t set)
{
    uint8_t tempbuff = set;
    ecg2_hal_write_bytes(LOFF_FLIP_REG, &tempbuff, 1);
}

int8_t ecg2_pace_detect_even_channels_select (pace_even_channels_t select)
{
    if (select > 3)
        return -1;

    else
    {
        uint8_t tempbuff = select;
        ecg2_hal_read_bytes(PACE_REG, &tempbuff, 1);
        tempbuff &= ~(3 << 3);
        tempbuff |= select << 3;
        ecg2_hal_write_bytes(PACE_REG, &tempbuff, 1 );
        return 0;
    }
}

int8_t ecg2_pace_detect_odd_channels_select (pace_odd_channels_t select)
{
    if (select > 3)
        return -1;

    else
    {
        uint8_t tempbuff = select;
        ecg2_hal_read_bytes(PACE_REG, &tempbuff, 1 );
        tempbuff &= ~(3 << 1);
        tempbuff |= select << 1;
        ecg2_hal_write_bytes(PACE_REG, &tempbuff, 1 );
        return 0;
    }
}

int8_t ecg2_pace_detect_buffer_enable ( bool enable )
{
    if (enable)
        register_bit_set(PACE_REG, 0, 1);
    else
        register_bit_set(PACE_REG, 0, 0);
}

void ecg2_single_shot_conversion_enable ( bool enable )
{
    if (enable)
        register_bit_set(CONFIG4_REG, 3, 1);
    else
        register_bit_set(CONFIG4_REG, 3, 0);
}

void ecg2_wct_to_rld_connection_enable ( bool enable )
{
    if (enable)
        register_bit_set(CONFIG4_REG, 2, 1);
    else
        register_bit_set(CONFIG4_REG, 2, 0);
}

void ecg2_lead_off_comparator_enable (bool enable )
{
    if (enable)
        register_bit_set(CONFIG4_REG, 1, 1);
    else
        register_bit_set(CONFIG4_REG, 1, 0);
}

void ecg2_wilson_center_terminal_configure (uint16_t set)
{
    uint8_t tempbuff[2];
    tempbuff[0] = (uint8_t) set; // lsb
    tempbuff[1] = (uint8_t) (set >> 8); // msb

    ecg2_hal_write_bytes(WCT1_REG, tempbuff, 2);
}