################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include stm32/driver/spi/subdir.mk
-include stm32/driver/serial/subdir.mk
-include stm32/driver/network/subdir.mk
-include stm32/common/subdir.mk
-include stm32/app/data/subdir.mk
-include stm32/app/control/subdir.mk
-include stm32/app/subdir.mk
-include host_common/subdir.mk
-include esp-common/protobuf-c/protobuf-c/subdir.mk
-include esp-common/subdir.mk
-include NetXDuo/Target/subdir.mk
-include NetXDuo/App/subdir.mk
-include Middlewares/ThreadX/RTOS/ThreadX/TraceX\ support/subdir.mk
-include Middlewares/ThreadX/RTOS/ThreadX/PerformanceInfo/subdir.mk
-include Middlewares/ThreadX/RTOS/ThreadX/Low\ Power\ support/subdir.mk
-include Middlewares/ThreadX/RTOS/ThreadX/Core/subdir.mk
-include Middlewares/ThreadX/RTOS/ThreadX/Compatibility/subdir.mk
-include Middlewares/NetXDuo/Network/NetXDuo/TraceX\ Support/subdir.mk
-include Middlewares/NetXDuo/Network/NetXDuo/TLS/subdir.mk
-include Middlewares/NetXDuo/Network/NetXDuo/NX\ Core/subdir.mk
-include Middlewares/NetXDuo/Network/NetXDuo/Crypto/subdir.mk
-include Middlewares/NetXDuo/Network/NetXDuo/Addons\ mDNS/subdir.mk
-include Middlewares/NetXDuo/Network/NetXDuo/Addons\ Web\ Client/subdir.mk
-include Middlewares/NetXDuo/Network/NetXDuo/Addons\ SNTP/subdir.mk
-include Middlewares/NetXDuo/Network/NetXDuo/Addons\ PPP/subdir.mk
-include Middlewares/NetXDuo/Network/NetXDuo/Addons\ MQTT/subdir.mk
-include Middlewares/NetXDuo/Network/NetXDuo/Addons\ DNS/subdir.mk
-include Middlewares/NetXDuo/Network/NetXDuo/Addons\ DHCP\ Client/subdir.mk
-include Middlewares/NetXDuo/Network/NetXDuo/Addons\ Cloud/subdir.mk
-include Middlewares/NetXDuo/Network/NetXDuo/Addons\ AutoIP/subdir.mk
-include Drivers/STM32H7xx_HAL_Driver/subdir.mk
-include Core/ThreadSafe/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include Common/Src/subdir.mk
-include AZURE_RTOS/App/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := esp-hosted-eval_CM7
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
esp-hosted-eval_CM7.elf \

MAP_FILES += \
esp-hosted-eval_CM7.map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
esp-hosted-eval_CM7.list \


# All Target
all: main-build

# Main-build Target
main-build: esp-hosted-eval_CM7.elf secondary-outputs

# Tool invocations
esp-hosted-eval_CM7.elf esp-hosted-eval_CM7.map: $(OBJS) $(USER_OBJS) C:\Users\khatti\STM32CubeIDE\workspace_1.8.0\esp-hosted-eval\CM7\STM32H757XIHX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "esp-hosted-eval_CM7.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m7 -T"C:\Users\khatti\STM32CubeIDE\workspace_1.8.0\esp-hosted-eval\CM7\STM32H757XIHX_FLASH.ld" --specs=nosys.specs -Wl,-Map="esp-hosted-eval_CM7.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

esp-hosted-eval_CM7.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "esp-hosted-eval_CM7.list"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) default.size.stdout esp-hosted-eval_CM7.elf esp-hosted-eval_CM7.list esp-hosted-eval_CM7.map
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
