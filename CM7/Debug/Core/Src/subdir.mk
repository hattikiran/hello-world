################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Core/Src/tx_initialize_low_level.s 

C_SRCS += \
../Core/Src/app_threadx.c \
../Core/Src/gpio.c \
../Core/Src/main.c \
../Core/Src/spi.c \
../Core/Src/stm32h7xx_hal_msp.c \
../Core/Src/stm32h7xx_hal_timebase_tim.c \
../Core/Src/stm32h7xx_it.c \
../Core/Src/syscalls.c \
../Core/Src/sysmem.c \
../Core/Src/usart.c 

OBJS += \
./Core/Src/app_threadx.o \
./Core/Src/gpio.o \
./Core/Src/main.o \
./Core/Src/spi.o \
./Core/Src/stm32h7xx_hal_msp.o \
./Core/Src/stm32h7xx_hal_timebase_tim.o \
./Core/Src/stm32h7xx_it.o \
./Core/Src/syscalls.o \
./Core/Src/sysmem.o \
./Core/Src/tx_initialize_low_level.o \
./Core/Src/usart.o 

S_DEPS += \
./Core/Src/tx_initialize_low_level.d 

C_DEPS += \
./Core/Src/app_threadx.d \
./Core/Src/gpio.d \
./Core/Src/main.d \
./Core/Src/spi.d \
./Core/Src/stm32h7xx_hal_msp.d \
./Core/Src/stm32h7xx_hal_timebase_tim.d \
./Core/Src/stm32h7xx_it.d \
./Core/Src/syscalls.d \
./Core/Src/sysmem.d \
./Core/Src/usart.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/%.o Core/Src/%.su: ../Core/Src/%.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DCORE_CM7 -DUSE_HAL_DRIVER -DSTM32H757xx '-DCODE_BASE=C:/Users/khatti/Documents/esp-hosted-h7' '-DINPUT_STATION__SSID="VIBE_K5"' '-DINPUT_STATION_PASSWORD="kiran123"' '-DINPUT_STATION_BSSID=""' '-DINPUT_STATION_IS_WPA3_SUPPORTED="yes"' '-DINPUT_STATION_SRC_IP="192.168.78.125"' '-DINPUT_SOFTAP_SRC_IP="192.168.2.1"' '-DINPUT_STATION_ARP_DEST_IP="192.168.211.1"' '-DINPUT_SOFTAP_ARP_DEST_IP="192.168.2.3"' '-DINPUT_SOFTAP__SSID="ESPWifi"' '-DINPUT_SOFTAP_PASSWORD="ESPWifi@123"' '-DINPUT_SOFTAP_CHANNEL="1"' '-DINPUT_SOFTAP_ENCRYPTION="WPA_WPA2_PSK"' '-DINPUT_SOFTAP_MAX_CONN="4"' '-DINPUT_SOFTAP_SSID_HIDDEN="no"' '-DINPUT_SOFTAP_BANDWIDTH="HT40"' '-DINPUT__OPERATING_MODE="SOFTAP"' '-DINPUT_GET_AP_SCAN_LIST="yes"' -DTX_INCLUDE_USER_DEFINE_FILE -DSTM32_THREAD_SAFE_STRATEGY=2 -DNX_INCLUDE_USER_DEFINE_FILE -c -I../Core/Inc -I../../Drivers/STM32H7xx_HAL_Driver/Inc -I../../Drivers/STM32H7xx_HAL_Driver/Inc/Legacy -I../../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../../Drivers/CMSIS/Include -I../Core/ThreadSafe -I"C:/Users/khatti/Documents/esp-hosted-h7/esp-common/include" -I"C:/Users/khatti/Documents/esp-hosted-h7/esp-common/protobuf-c" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/host_common/include" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/common" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/driver/network" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/driver/netif" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/driver/serial" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/driver/spi" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/app/control" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/app/data" -I"C:/Users/khatti/Documents/esp-hosted-h7/host/stm32/app" -I../AZURE_RTOS/App -I../../Middlewares/ST/threadx/common/inc/ -I../../Middlewares/ST/threadx/ports/cortex_m7/gnu/inc/ -I../../Middlewares/ST/threadx/utility/low_power/ -I../../Middlewares/ST/threadx/utility/rtos_compatibility_layers/FreeRTOS -I../NetXDuo/App -I../NetXDuo/Target -I../../Middlewares/ST/netxduo/addons/mqtt/ -I../../Middlewares/ST/netxduo/addons/sntp/ -I../../Middlewares/ST/netxduo/addons/auto_ip/ -I../../Middlewares/ST/netxduo/addons/dns/ -I../../Middlewares/ST/netxduo/addons/web/ -I../../Middlewares/ST/netxduo/common/inc/ -I../../Middlewares/ST/netxduo/ports/cortex_m7/gnu/inc/ -I../../Middlewares/ST/netxduo/nx_secure/inc/ -I../../Middlewares/ST/netxduo/nx_secure/ports/ -I../../Middlewares/ST/netxduo/crypto_libraries/inc/ -I../../Middlewares/ST/netxduo/crypto_libraries/ports/cortex_m7/gnu/inc/ -I../../Middlewares/ST/netxduo/addons/mdns/ -I../../Middlewares/ST/netxduo/addons/cloud/ -I../../Middlewares/ST/netxduo/addons/ppp/ -I../../Middlewares/ST/netxduo/addons/dhcp/ -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/%.o: ../Core/Src/%.s Core/Src/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Core-2f-Src

clean-Core-2f-Src:
	-$(RM) ./Core/Src/app_threadx.d ./Core/Src/app_threadx.o ./Core/Src/app_threadx.su ./Core/Src/gpio.d ./Core/Src/gpio.o ./Core/Src/gpio.su ./Core/Src/main.d ./Core/Src/main.o ./Core/Src/main.su ./Core/Src/spi.d ./Core/Src/spi.o ./Core/Src/spi.su ./Core/Src/stm32h7xx_hal_msp.d ./Core/Src/stm32h7xx_hal_msp.o ./Core/Src/stm32h7xx_hal_msp.su ./Core/Src/stm32h7xx_hal_timebase_tim.d ./Core/Src/stm32h7xx_hal_timebase_tim.o ./Core/Src/stm32h7xx_hal_timebase_tim.su ./Core/Src/stm32h7xx_it.d ./Core/Src/stm32h7xx_it.o ./Core/Src/stm32h7xx_it.su ./Core/Src/syscalls.d ./Core/Src/syscalls.o ./Core/Src/syscalls.su ./Core/Src/sysmem.d ./Core/Src/sysmem.o ./Core/Src/sysmem.su ./Core/Src/tx_initialize_low_level.d ./Core/Src/tx_initialize_low_level.o ./Core/Src/usart.d ./Core/Src/usart.o ./Core/Src/usart.su

.PHONY: clean-Core-2f-Src

