################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/khatti/STM32CubeIDE/workspace_1.8.0/esp-hosted-eval/Middlewares/ST/netxduo/common/src/nx_trace_event_insert.c \
C:/Users/khatti/STM32CubeIDE/workspace_1.8.0/esp-hosted-eval/Middlewares/ST/netxduo/common/src/nx_trace_event_update.c \
C:/Users/khatti/STM32CubeIDE/workspace_1.8.0/esp-hosted-eval/Middlewares/ST/netxduo/common/src/nx_trace_object_register.c \
C:/Users/khatti/STM32CubeIDE/workspace_1.8.0/esp-hosted-eval/Middlewares/ST/netxduo/common/src/nx_trace_object_unregister.c 

OBJS += \
./Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_event_insert.o \
./Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_event_update.o \
./Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_object_register.o \
./Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_object_unregister.o 

C_DEPS += \
./Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_event_insert.d \
./Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_event_update.d \
./Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_object_register.d \
./Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_object_unregister.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_event_insert.o: C:/Users/khatti/STM32CubeIDE/workspace_1.8.0/esp-hosted-eval/Middlewares/ST/netxduo/common/src/nx_trace_event_insert.c Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DCORE_CM7 -DUSE_HAL_DRIVER -DSTM32H757xx '-DCODE_BASE=C:/Users/khatti/Documents/esp-hosted-h7' '-DINPUT_STATION__SSID="VIBE_K5"' '-DINPUT_STATION_PASSWORD="kiran123"' '-DINPUT_STATION_BSSID=""' '-DINPUT_STATION_IS_WPA3_SUPPORTED="yes"' '-DINPUT_STATION_SRC_IP="192.168.78.125"' '-DINPUT_SOFTAP_SRC_IP="192.168.2.1"' '-DINPUT_STATION_ARP_DEST_IP="192.168.211.1"' '-DINPUT_SOFTAP_ARP_DEST_IP="192.168.2.3"' '-DINPUT_SOFTAP__SSID="ESPWifi"' '-DINPUT_SOFTAP_PASSWORD="ESPWifi@123"' '-DINPUT_SOFTAP_CHANNEL="1"' '-DINPUT_SOFTAP_ENCRYPTION="WPA_WPA2_PSK"' '-DINPUT_SOFTAP_MAX_CONN="4"' '-DINPUT_SOFTAP_SSID_HIDDEN="no"' '-DINPUT_SOFTAP_BANDWIDTH="HT40"' '-DINPUT__OPERATING_MODE="SOFTAP"' '-DINPUT_GET_AP_SCAN_LIST="yes"' -DTX_INCLUDE_USER_DEFINE_FILE -DSTM32_THREAD_SAFE_STRATEGY=2 -DNX_INCLUDE_USER_DEFINE_FILE -c -I../Core/Inc -I../../Drivers/STM32H7xx_HAL_Driver/Inc -I../../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../../Drivers/CMSIS/Include -I../Core/ThreadSafe -I"C:/Users/khatti/Documents/esp-hosted-h7/esp-common/include" -I"C:/Users/khatti/Documents/esp-hosted-h7/esp-common/protobuf-c" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/host_common/include" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/common" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/driver/network" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/driver/netif" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/driver/serial" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/driver/spi" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/app/control" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/app/data" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/app" -I../AZURE_RTOS/App -I../../Middlewares/ST/threadx/common/inc/ -I../../Middlewares/ST/threadx/ports/cortex_m7/gnu/inc/ -I../../Middlewares/ST/threadx/utility/low_power/ -I../../Middlewares/ST/threadx/utility/rtos_compatibility_layers/FreeRTOS -I../NetXDuo/App -I../NetXDuo/Target -I../../Middlewares/ST/netxduo/addons/mqtt/ -I../../Middlewares/ST/netxduo/addons/sntp/ -I../../Middlewares/ST/netxduo/addons/auto_ip/ -I../../Middlewares/ST/netxduo/addons/dns/ -I../../Middlewares/ST/netxduo/addons/web/ -I../../Middlewares/ST/netxduo/common/inc/ -I../../Middlewares/ST/netxduo/ports/cortex_m7/gnu/inc/ -I../../Middlewares/ST/netxduo/nx_secure/inc/ -I../../Middlewares/ST/netxduo/nx_secure/ports/ -I../../Middlewares/ST/netxduo/crypto_libraries/inc/ -I../../Middlewares/ST/netxduo/crypto_libraries/ports/cortex_m7/gnu/inc/ -I../../Middlewares/ST/netxduo/addons/mdns/ -I../../Middlewares/ST/netxduo/addons/cloud/ -I../../Middlewares/ST/netxduo/addons/ppp/ -I../../Middlewares/ST/netxduo/addons/dhcp/ -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Middlewares/NetXDuo/Network/NetXDuo/TraceX Support/nx_trace_event_insert.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_event_update.o: C:/Users/khatti/STM32CubeIDE/workspace_1.8.0/esp-hosted-eval/Middlewares/ST/netxduo/common/src/nx_trace_event_update.c Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DCORE_CM7 -DUSE_HAL_DRIVER -DSTM32H757xx '-DCODE_BASE=C:/Users/khatti/Documents/esp-hosted-h7' '-DINPUT_STATION__SSID="VIBE_K5"' '-DINPUT_STATION_PASSWORD="kiran123"' '-DINPUT_STATION_BSSID=""' '-DINPUT_STATION_IS_WPA3_SUPPORTED="yes"' '-DINPUT_STATION_SRC_IP="192.168.78.125"' '-DINPUT_SOFTAP_SRC_IP="192.168.2.1"' '-DINPUT_STATION_ARP_DEST_IP="192.168.211.1"' '-DINPUT_SOFTAP_ARP_DEST_IP="192.168.2.3"' '-DINPUT_SOFTAP__SSID="ESPWifi"' '-DINPUT_SOFTAP_PASSWORD="ESPWifi@123"' '-DINPUT_SOFTAP_CHANNEL="1"' '-DINPUT_SOFTAP_ENCRYPTION="WPA_WPA2_PSK"' '-DINPUT_SOFTAP_MAX_CONN="4"' '-DINPUT_SOFTAP_SSID_HIDDEN="no"' '-DINPUT_SOFTAP_BANDWIDTH="HT40"' '-DINPUT__OPERATING_MODE="SOFTAP"' '-DINPUT_GET_AP_SCAN_LIST="yes"' -DTX_INCLUDE_USER_DEFINE_FILE -DSTM32_THREAD_SAFE_STRATEGY=2 -DNX_INCLUDE_USER_DEFINE_FILE -c -I../Core/Inc -I../../Drivers/STM32H7xx_HAL_Driver/Inc -I../../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../../Drivers/CMSIS/Include -I../Core/ThreadSafe -I"C:/Users/khatti/Documents/esp-hosted-h7/esp-common/include" -I"C:/Users/khatti/Documents/esp-hosted-h7/esp-common/protobuf-c" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/host_common/include" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/common" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/driver/network" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/driver/netif" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/driver/serial" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/driver/spi" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/app/control" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/app/data" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/app" -I../AZURE_RTOS/App -I../../Middlewares/ST/threadx/common/inc/ -I../../Middlewares/ST/threadx/ports/cortex_m7/gnu/inc/ -I../../Middlewares/ST/threadx/utility/low_power/ -I../../Middlewares/ST/threadx/utility/rtos_compatibility_layers/FreeRTOS -I../NetXDuo/App -I../NetXDuo/Target -I../../Middlewares/ST/netxduo/addons/mqtt/ -I../../Middlewares/ST/netxduo/addons/sntp/ -I../../Middlewares/ST/netxduo/addons/auto_ip/ -I../../Middlewares/ST/netxduo/addons/dns/ -I../../Middlewares/ST/netxduo/addons/web/ -I../../Middlewares/ST/netxduo/common/inc/ -I../../Middlewares/ST/netxduo/ports/cortex_m7/gnu/inc/ -I../../Middlewares/ST/netxduo/nx_secure/inc/ -I../../Middlewares/ST/netxduo/nx_secure/ports/ -I../../Middlewares/ST/netxduo/crypto_libraries/inc/ -I../../Middlewares/ST/netxduo/crypto_libraries/ports/cortex_m7/gnu/inc/ -I../../Middlewares/ST/netxduo/addons/mdns/ -I../../Middlewares/ST/netxduo/addons/cloud/ -I../../Middlewares/ST/netxduo/addons/ppp/ -I../../Middlewares/ST/netxduo/addons/dhcp/ -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Middlewares/NetXDuo/Network/NetXDuo/TraceX Support/nx_trace_event_update.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_object_register.o: C:/Users/khatti/STM32CubeIDE/workspace_1.8.0/esp-hosted-eval/Middlewares/ST/netxduo/common/src/nx_trace_object_register.c Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DCORE_CM7 -DUSE_HAL_DRIVER -DSTM32H757xx '-DCODE_BASE=C:/Users/khatti/Documents/esp-hosted-h7' '-DINPUT_STATION__SSID="VIBE_K5"' '-DINPUT_STATION_PASSWORD="kiran123"' '-DINPUT_STATION_BSSID=""' '-DINPUT_STATION_IS_WPA3_SUPPORTED="yes"' '-DINPUT_STATION_SRC_IP="192.168.78.125"' '-DINPUT_SOFTAP_SRC_IP="192.168.2.1"' '-DINPUT_STATION_ARP_DEST_IP="192.168.211.1"' '-DINPUT_SOFTAP_ARP_DEST_IP="192.168.2.3"' '-DINPUT_SOFTAP__SSID="ESPWifi"' '-DINPUT_SOFTAP_PASSWORD="ESPWifi@123"' '-DINPUT_SOFTAP_CHANNEL="1"' '-DINPUT_SOFTAP_ENCRYPTION="WPA_WPA2_PSK"' '-DINPUT_SOFTAP_MAX_CONN="4"' '-DINPUT_SOFTAP_SSID_HIDDEN="no"' '-DINPUT_SOFTAP_BANDWIDTH="HT40"' '-DINPUT__OPERATING_MODE="SOFTAP"' '-DINPUT_GET_AP_SCAN_LIST="yes"' -DTX_INCLUDE_USER_DEFINE_FILE -DSTM32_THREAD_SAFE_STRATEGY=2 -DNX_INCLUDE_USER_DEFINE_FILE -c -I../Core/Inc -I../../Drivers/STM32H7xx_HAL_Driver/Inc -I../../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../../Drivers/CMSIS/Include -I../Core/ThreadSafe -I"C:/Users/khatti/Documents/esp-hosted-h7/esp-common/include" -I"C:/Users/khatti/Documents/esp-hosted-h7/esp-common/protobuf-c" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/host_common/include" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/common" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/driver/network" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/driver/netif" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/driver/serial" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/driver/spi" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/app/control" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/app/data" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/app" -I../AZURE_RTOS/App -I../../Middlewares/ST/threadx/common/inc/ -I../../Middlewares/ST/threadx/ports/cortex_m7/gnu/inc/ -I../../Middlewares/ST/threadx/utility/low_power/ -I../../Middlewares/ST/threadx/utility/rtos_compatibility_layers/FreeRTOS -I../NetXDuo/App -I../NetXDuo/Target -I../../Middlewares/ST/netxduo/addons/mqtt/ -I../../Middlewares/ST/netxduo/addons/sntp/ -I../../Middlewares/ST/netxduo/addons/auto_ip/ -I../../Middlewares/ST/netxduo/addons/dns/ -I../../Middlewares/ST/netxduo/addons/web/ -I../../Middlewares/ST/netxduo/common/inc/ -I../../Middlewares/ST/netxduo/ports/cortex_m7/gnu/inc/ -I../../Middlewares/ST/netxduo/nx_secure/inc/ -I../../Middlewares/ST/netxduo/nx_secure/ports/ -I../../Middlewares/ST/netxduo/crypto_libraries/inc/ -I../../Middlewares/ST/netxduo/crypto_libraries/ports/cortex_m7/gnu/inc/ -I../../Middlewares/ST/netxduo/addons/mdns/ -I../../Middlewares/ST/netxduo/addons/cloud/ -I../../Middlewares/ST/netxduo/addons/ppp/ -I../../Middlewares/ST/netxduo/addons/dhcp/ -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Middlewares/NetXDuo/Network/NetXDuo/TraceX Support/nx_trace_object_register.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_object_unregister.o: C:/Users/khatti/STM32CubeIDE/workspace_1.8.0/esp-hosted-eval/Middlewares/ST/netxduo/common/src/nx_trace_object_unregister.c Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DCORE_CM7 -DUSE_HAL_DRIVER -DSTM32H757xx '-DCODE_BASE=C:/Users/khatti/Documents/esp-hosted-h7' '-DINPUT_STATION__SSID="VIBE_K5"' '-DINPUT_STATION_PASSWORD="kiran123"' '-DINPUT_STATION_BSSID=""' '-DINPUT_STATION_IS_WPA3_SUPPORTED="yes"' '-DINPUT_STATION_SRC_IP="192.168.78.125"' '-DINPUT_SOFTAP_SRC_IP="192.168.2.1"' '-DINPUT_STATION_ARP_DEST_IP="192.168.211.1"' '-DINPUT_SOFTAP_ARP_DEST_IP="192.168.2.3"' '-DINPUT_SOFTAP__SSID="ESPWifi"' '-DINPUT_SOFTAP_PASSWORD="ESPWifi@123"' '-DINPUT_SOFTAP_CHANNEL="1"' '-DINPUT_SOFTAP_ENCRYPTION="WPA_WPA2_PSK"' '-DINPUT_SOFTAP_MAX_CONN="4"' '-DINPUT_SOFTAP_SSID_HIDDEN="no"' '-DINPUT_SOFTAP_BANDWIDTH="HT40"' '-DINPUT__OPERATING_MODE="SOFTAP"' '-DINPUT_GET_AP_SCAN_LIST="yes"' -DTX_INCLUDE_USER_DEFINE_FILE -DSTM32_THREAD_SAFE_STRATEGY=2 -DNX_INCLUDE_USER_DEFINE_FILE -c -I../Core/Inc -I../../Drivers/STM32H7xx_HAL_Driver/Inc -I../../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../../Drivers/CMSIS/Include -I../Core/ThreadSafe -I"C:/Users/khatti/Documents/esp-hosted-h7/esp-common/include" -I"C:/Users/khatti/Documents/esp-hosted-h7/esp-common/protobuf-c" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/host_common/include" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/common" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/driver/network" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/driver/netif" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/driver/serial" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/driver/spi" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/app/control" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/app/data" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/app" -I../AZURE_RTOS/App -I../../Middlewares/ST/threadx/common/inc/ -I../../Middlewares/ST/threadx/ports/cortex_m7/gnu/inc/ -I../../Middlewares/ST/threadx/utility/low_power/ -I../../Middlewares/ST/threadx/utility/rtos_compatibility_layers/FreeRTOS -I../NetXDuo/App -I../NetXDuo/Target -I../../Middlewares/ST/netxduo/addons/mqtt/ -I../../Middlewares/ST/netxduo/addons/sntp/ -I../../Middlewares/ST/netxduo/addons/auto_ip/ -I../../Middlewares/ST/netxduo/addons/dns/ -I../../Middlewares/ST/netxduo/addons/web/ -I../../Middlewares/ST/netxduo/common/inc/ -I../../Middlewares/ST/netxduo/ports/cortex_m7/gnu/inc/ -I../../Middlewares/ST/netxduo/nx_secure/inc/ -I../../Middlewares/ST/netxduo/nx_secure/ports/ -I../../Middlewares/ST/netxduo/crypto_libraries/inc/ -I../../Middlewares/ST/netxduo/crypto_libraries/ports/cortex_m7/gnu/inc/ -I../../Middlewares/ST/netxduo/addons/mdns/ -I../../Middlewares/ST/netxduo/addons/cloud/ -I../../Middlewares/ST/netxduo/addons/ppp/ -I../../Middlewares/ST/netxduo/addons/dhcp/ -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Middlewares/NetXDuo/Network/NetXDuo/TraceX Support/nx_trace_object_unregister.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-NetXDuo-2f-Network-2f-NetXDuo-2f-TraceX-20-Support

clean-Middlewares-2f-NetXDuo-2f-Network-2f-NetXDuo-2f-TraceX-20-Support:
	-$(RM) ./Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_event_insert.d ./Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_event_insert.o ./Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_event_insert.su ./Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_event_update.d ./Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_event_update.o ./Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_event_update.su ./Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_object_register.d ./Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_object_register.o ./Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_object_register.su ./Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_object_unregister.d ./Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_object_unregister.o ./Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/nx_trace_object_unregister.su

.PHONY: clean-Middlewares-2f-NetXDuo-2f-Network-2f-NetXDuo-2f-TraceX-20-Support

