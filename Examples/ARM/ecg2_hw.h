typedef enum
{
    KSPS_8 = 0,
    KSPS_4,
    KSPS_2,
    KSPS_1,
    SPS_500,
    SPS_250,
    SPS_125
}output_data_rate_t;

typedef enum
{
    TEST_SOURCE_EXTERNAL = 0,
    TEST_SOURCE_INTERNAL
}test_source_t;

typedef enum
{
    NEGATIVE_1 = 0,
    NEGATIVE_2
}test_amplitude_t;

typedef enum
{
    F_DIV_2_TO_21,
    F_DIV_2_TO_20,
    NOT_USED,
    AT_DC
}test_frequency_t;

typedef enum
{
    VREF_2_4V,
    VREF_4V
}reference_voltage_t;

typedef enum
{
    RLDEF_SIGNAL_EXTERNAL,
    RLDEF_SIGNAL_INTERNAL
}rldef_signal_t;

typedef enum
{
    POSITIVE_50 = 0,
    POSITIVE_92_5,
    POSITIVE_90,
    POSITIVE_87_5,
    POSITIVE_85,
    POSITIVE_80,
    POSITIVE_75,
    POSITIVE_70,
    NEGATIVE_5 = 0,
    NEGATIVE_7_5,
    NEGATIVE_10,
    NEGATIVE_12_5,
    NEGATIVE_15,
    NEGATIVE_20,
    NEGATIVE_25,
    NEGATIVE_30
}lead_off_threshold_t;

typedef enum
{
    NA_4,
    NA_8,
    NA_12,
    NA_16
}ilead_off_magnitude_t;

typedef enum
{
    CHANNEL_2 = 0,
    CHANNEL_4,
    CHANNEL_6,
    CHANNEL_8,
}pace_even_channels_t;

typedef enum
{
    CHANNEL_1 = 0,
    CHANNEL_3,
    CHANNEL_5,
    CHANNEL_7
}pace_odd_channels_t;


/**
 * @brief ecg2_get_device_id
 * Returns the device ID
 * @return
 * device ID
 */
uint8_t ecg2_get_device_id();

/**
 * @brief ecg2_daisy_chain_enable
 * Enables/disables daisy chain connection
 * @param enable
 * true - enable
 * false - disable
 */
void ecg2_daisy_chain_enable(bool enable);

/**
 * @brief ecg2_oscillator_clock_enable
 * Enables/disables the internal oscillator clock
 * @param enable
 * true - enable
 * false- disable
 */
void ecg2_oscillator_clock_enable ( bool enable );
/**
 * @brief ecg2_set_output_data_rate
 * Sets the desired output data rate
 * @param output_data_rate
 * Desired output data rate, check datasheet page 41 for more information
 * @return
 * Returns 0 if a valid data rate is passed, -1 if not
 */
int8_t ecg2_set_output_data_rate(output_data_rate_t output_data_rate);

/**
 * @brief ecg2_set_test_source
 * Selects the source for the test signal
 * @param test_source
 * Test source: 0 - external, 1 - internal
 * @return
 * Returns 0 if a valid source is passed, -1 if not
 */
int8_t ecg2_set_test_source(test_source_t test_source);

/**
 * @brief ecg2_set_test_amplitude
 * Sets the amplitude of the test signal
 * @param amplitutde
 * Desired amplitude, can be 0 or 1, check datasheet page 42 for more information
 * @return
 * Returns 0 if a valid parameter is passed, -1 if not
 */
int8_t ecg2_set_test_amplitude (test_amplitude_t amplitutde);

/**
 * @brief ecg2_set_test_frequency
 * Sets the frequency of the test signal
 * @param frequency
 * Desired frequency,as stated in the datasheet, page 42
 * @return
 * Returns 0 if a valid parameter is passed, -1 if not
 */
int8_t ecg2_set_test_frequency (test_frequency_t frequency);
/**
 * @brief ecg2_power_down_reference_buffer_enable
 * Enables/disables the power down reference buffer
 * @param enable
 * true - enable
 * false - disable
 */

void ecg2_power_down_reference_buffer_enable(bool enable);

/**
 * @brief ecg2_set_reference_voltage
 * Sets tje reference voltage
 * @param refvol
 * 0 - reference voltage is 2.4V, 1 - reference voltage is 4V
 * @return
 * Returns 0 if a valid parameter is passed, -1 if not
 */
int8_t ecg2_set_reference_voltage(reference_voltage_t refvol);

/**
 * @brief ecg2_rld_measurement_enable
 * Enables/disables RLD measurement
 * @param enable
 * true - enable, false - disable
 */
void ecg2_rld_measurement_enable( bool enable );

/**
 * @brief ecg2_rldref_source_select
 * Sets the RLDREF signal source
 * @param source
 * 0 - RLDREF signal fed externally, 1 - RLDREF signal (AVDD – AVSS)/2 generated internally
 * @return
 * Returns 0 if a valid parameter is passed, -1 if not
 */
int8_t ecg2_rldref_source_select(rldef_signal_t source);

/**
 * @brief ecg2_rld_buffer_enable
 * Enables/disables RLD buffer
 * @param enable
 * true - enable, false - disable
 */
void ecg2_rld_buffer_enable(bool enable);

/**
 * @brief ecg2_rld_sense_enable
 * Enables/disables the RLD sense function
 * @param enable
 * true - enable, false - disable
 */
void ecg2_rld_sense_enable(bool enable);

/**
 * @brief ecg2_rld_get_status
 * Returns the RLD status
 * @return
 * 0 - RLD is connected, 1 - RLD is not connected
 */
uint8_t ecg2_rld_get_status ();

/**
 * @brief ecg2_lead_off_comparator_threshold_set
 * Configures the lead-off comparator threshold level setting
 * @param threshold
 * Desired threshold, check datasheet page 44 for more information
 * @return
 * Returns 0 if valid parameter is passed, -1 if not
 */
int8_t ecg2_lead_off_comparator_threshold_set(lead_off_threshold_t threshold);

/**
 * @brief ecg2_vlead_off_enable
 * Enables/ disables the lead-off detection mode
 * @param enable
 * true - enable, false - disable
 */
void ecg2_vlead_off_enable(bool enable);

/**
 * @brief ecg2_ilead_off_magnitude_set
 * Sets the magnitude of current for the current lead-off mode.
 * @param set
 * Desired magnitude
 * @return
 * Returns 0 if valid parameter is passed, -1 if not
 */
int8_t ecg2_ilead_off_magnitude_set (ilead_off_magnitude_t set);

/**
 * @brief ecg2_flead_off_frequency_set
 * Configures the frequency of lead-off detect for each channel.
 * @param set
 * Desired frequency, check datasheet page 44 for more information
 * @return
 * Returns 0 if valid parameter is passed, -1 if not
 */
int8_t ecg2_flead_off_frequency_set (uint8_t set);

/**
 * @brief ecg2_configure_channel
 * Configures a desired channel
 * @param channel
 * Number of the channel to be configured
 * @param power_down
 * Enables/disables the channel: true - enabled, false - disabled
 * @param pga_gain
 * Sets the PGA gain, check datasheet page 45 for more information
 * @param channel_input
 * Configures the channel input, check datasheet page 45 for more information
 * @return
 * Returns 0 if valid parameter is passed, -1 if not
 */
int8_t ecg2_configure_channel (uint8_t channel, bool power_down, uint8_t pga_gain, uint8_t channel_input);

/**
 * @brief ecg2_right_leg_positive_drive_set
 * Configures the selection of the positive signals from each channel for right leg drive derivation.
 * Check datasheet page 45 for more information
 * @param set
 * Desired configuration
 */
void ecg2_right_leg_positive_drive_set(uint8_t set);

/**
 * @brief ecg2_right_leg_negative_drive_set
 * Determines the selection of the negative signals from each channel for right leg drive derivation.
 * Check datasheet page 45 for more information
 * @param set
 * Desired configuration
 */
void ecg2_right_leg_negative_drive_set(uint8_t set);

/**
 * @brief ecg2_lead_off_positive_channel_select
 * Selects the positive side from each channel for lead-off detection
 * Check datasheet page 46 for more information
 * @param set
 * Desired configuration
 */
void ecg2_lead_off_positive_channel_select (uint8_t set);

/**
 * @brief ecg2_lead_off_negative_channel_select
 * Selects the negative side from each channel for lead-off detection
 * Check datasheet page 46 for more information
 * @param set
 * Desired configuration
 */
void ecg2_lead_off_negative_channel_select (uint8_t set);

/**
 * @brief ecg2_lead_off_current_direction_select
 * Controls the direction of the current used for lead-off derivation
 * Check datasheet page 46 for more information
 * @param set
 * Desired configuration
 */
void ecg2_lead_off_current_direction_select (uint8_t set);

/**
 * @brief ecg2_pace_detect_even_channels_select
 * Determines the selection of the even number channels available on TEST_PACE_OUT1. Note that only one channel
 * may be selected at any time.
 * @param select
 * Desired configuration
 * @return
 * Returns 0 if a valid parameter is passed, -1 if not
 */
int8_t ecg2_pace_detect_even_channels_select (pace_even_channels_t select);

/**
 * @brief ecg2_pace_detect_odd_channels_select
 * Determines the selection of the odd number channels available on TEST_PACE_OUT2. Note that only one channel
 * may be selected at any time.
 * @param select
 * Desired configuration
 * @return
 * Returns 0 if a valid parameter is passed, -1 if not
 */
int8_t ecg2_pace_detect_odd_channels_select (pace_odd_channels_t select);

/**
 * @brief ecg2_pace_detect_buffer_enable
 * Enables/disables the pace detect buffer
 * @param enable
 * True - enabled, false - disabled
 */
void ecg2_pace_detect_buffer_enable ( bool enable );

/**
 * @brief ecg2_single_shot_conversion_enable
 * Enables/disables single shot conversion mode
 * @param enable
 * true - single shot conversion, false - continuous conversion
 */
void ecg2_single_shot_conversion_enable ( bool enable );

/**
 * @brief ecg2_wct_to_rld_connection_enable
 * Connects the WCT to the RLD
 * @param enable
 * true - connected, false - disconnected
 */
void ecg2_wct_to_rld_connection_enable ( bool enable );

/**
 * @brief lead_off_comparator_enable
 * Enables/disables the lead-off comparators.
 * @param enable
 * True - enabled, false - disabled
 */
void ecg2_lead_off_comparator_enable (bool enable );

/**
 * @brief wilson_center_terminal_configure
 * Configures the wilson center terminal, see datasheet page 50 for more information
 * @param set
 * Desired configuration
 */
void ecg2_wilson_center_terminal_configure (uint16_t set);