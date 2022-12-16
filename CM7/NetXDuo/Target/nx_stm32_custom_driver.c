/**************************************************************************/
/*                                                                        */
/*       Copyright (c) Microsoft Corporation. All rights reserved.        */
/*                                                                        */
/*       This software is licensed under the Microsoft Software License   */
/*       Terms for Microsoft Azure RTOS. Full text of the license can be  */
/*       found in the LICENSE file at https://aka.ms/AzureRTOS_EULA       */
/*       and in the root directory of this software.                      */
/*                                                                        */
/**************************************************************************/

/* Private includes ----------------------------------------------------------*/
#include "nx_stm32_custom_driver.h"

/* USER CODE BEGIN Includes */
#include "control.h"
#include "netdev_if.h"
#include "nx_api.h"
#include "spi_drv.h"
#include "string.h"
#include "app_main.h"
#include "netdev_api.h"
#include <inttypes.h>
#include <stdlib.h>
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
typedef struct MAC_ADDRESS_STRUCT
{
    ULONG nx_mac_address_msw;
    ULONG nx_mac_address_lsw;
} MAC_ADDRESS;
/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* Define the Link MTU. Note this is not the same as the IP MTU.  The Link MTU
   includes the addition of the Physical Network header (usually Ethernet). This
   should be larger than the IP instance MTU by the size of the physical header. */
#define NETX_DUO_INTERFACE

#define NX_LINK_MTU      				1536		/*Refer the mcu-architecture in esp-hosted-github page */

#define NX_ETHERNET_IP   				0x0800
#define NX_ETHERNET_ARP  				0x0806
#define NX_ETHERNET_RARP 				0x8035
#define NX_ETHERNET_SIZE 				14

#define OPCODE_LEN                       2

#define ARPING_OFFSET_SRC_MAC            6
#define ARPING_OFFSET_SRC_REPEAT_MAC     22
#define ARPING_OFFSET_DST_MAC            0
#define ARPING_OFFSET_DST_REPEAT_MAC     32
#define ARPING_OFFSET_SRC_IP             28
#define ARPING_OFFSET_DST_IP             38
#define ARPING_OFFSET_OPCODE             20
#define ARPING_MAX_PKT_SIZE              42

/* For the simulated ethernet driver, physical addresses are allocated starting
   at the preset value and then incremented before the next allocation.  */

uint8_t *mac_address;
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
/* USER CODE BEGIN PV */
#ifndef NETX_DUO_INTERFACE
struct netdev {
	/* Interface name */
	char name[MAX_IF_NAME_SIZE];

	/* Driver API's */
	struct netdev_ops *net_ops;

	/* Netdev state */
	uint8_t state;

	/*Application handle */
	struct network_handle *net_handle;

	/* Rx queue */
	QueueHandle_t rx_q;
	//TX_QUEUE rx_q;
	/* Driver priv */
	void *priv;
};
*/
struct network_handle {
	struct netdev *ndev;
	void (* net_rx_callback)();
};
#endif /* NETX_DUO_INTERFACE */

typedef struct _nx_driver_instance_type
{
    UINT          nx_network_driver_in_use;
    UINT          nx_driver_id;
    NX_INTERFACE *nx_interface_ptr;
    NX_IP        *nx_driver_ip_ptr;
    MAC_ADDRESS   nx_driver_mac_address;
    struct network_handle * interface_handle;
} _nx_driver_instance;

#define MAX_INTERFACES 2
static _nx_driver_instance nx_wifi_driver[MAX_INTERFACES];

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
/* USER CODE BEGIN PFP */
void station_callback(struct network_handle * handle);
void softap_callback(struct network_handle * handle);
void  _nx_wifi_driver_receive(NX_IP *ip_ptr, NX_PACKET *packet_ptr, UINT interface_instance_id);
/* USER CODE END PFP */



VOID  nx_stm32_custom_driver(NX_IP_DRIVER *driver_req_ptr)
{
	/* USER CODE BEGIN 1 */
	UINT          i = 0;
	NX_IP        *ip_ptr;
	NX_PACKET    *packet_ptr;
	ULONG        *ethernet_frame_ptr;
	NX_INTERFACE *interface_ptr;
	UINT          interface_index;

	/* Setup the IP pointer from the driver request.  */
	    ip_ptr =  driver_req_ptr -> nx_ip_driver_ptr;

	    /* Default to successful return.  */
	    driver_req_ptr -> nx_ip_driver_status =  NX_SUCCESS;

	    /* Setup interface pointer.  */
	    interface_ptr = driver_req_ptr -> nx_ip_driver_interface;

	    /* Obtain the index number of the network interface. */
	    interface_index = interface_ptr -> nx_interface_index;
	/* USER CODE END 1 */
    /* Process according to the driver request type in the IP control
       block.  */
    switch (driver_req_ptr -> nx_ip_driver_command)
    {

    case NX_LINK_INTERFACE_ATTACH:
    /* USER CODE BEGIN NX_LINK_INTERFACE_ATTACH */
    	reset_slave();
		/* Find an available driver instance to attach the interface. */
		for (int i = 0; i < MAX_INTERFACES; i++) {
			if (nx_wifi_driver[i].nx_network_driver_in_use == 0) {
				break;
			}

		}

		if (i >= MAX_INTERFACES) {
			driver_req_ptr->nx_ip_driver_status = NX_INVALID_INTERFACE;
		} else {
			/* Record the interface attached to the IP instance. */
			nx_wifi_driver[i].nx_interface_ptr = driver_req_ptr->nx_ip_driver_interface;
			/* Record the IP instance. */
			nx_wifi_driver[i].nx_driver_ip_ptr = driver_req_ptr->nx_ip_driver_ptr;

			/*nx_wifi_driver[i].nx_driver_mac_address.nx_mac_address_msw =
					simulated_address_msw;
			nx_wifi_driver[i].nx_driver_mac_address.nx_mac_address_lsw =
					simulated_address_lsw + i;*/

			nx_wifi_driver[i].nx_network_driver_in_use = 1;
			nx_wifi_driver[i].nx_driver_id = i;


		}

    /* USER CODE END NX_LINK_INTERFACE_ATTACH */
        break;

    case NX_LINK_INITIALIZE:
    /* USER CODE BEGIN NX_LINK_INITIALIZE */
		//reset_slave();
		/* The nx_interface_ip_mtu_size should be the MTU for the IP payload.
		 For regular Ethernet, the IP MTU is 1500. */

		//uint8_t *mac_address = NULL;
		/*nx_ip_interface_mtu_set(ip_ptr, interface_index,
				(NX_LINK_MTU - NX_ETHERNET_SIZE));*/

		/* Set the physical address (MAC address) of this IP instance.  */
		/* For this simulated RAM driver, the MAC address is constructed by
		 incrementing a base lsw value, to simulate multiple nodes on the
		 ethernet.  */
		/* TODO - Check if the below function syntax is correct */

		network_init();


    /* USER CODE END NX_LINK_INITIALIZE */
        break;

    case NX_LINK_ENABLE:
    /* USER CODE BEGIN NX_LINK_ENABLE */
    	stm_spi_init(spi_driver_event_handler);
		if (strncmp(driver_req_ptr->nx_ip_driver_ptr->nx_ip_name, SOFTAP_INTERFACE,
				sizeof(SOFTAP_INTERFACE)) == 0) {
			nx_wifi_driver[i].interface_handle = network_open(SOFTAP_INTERFACE, softap_callback);
			mac_address = get_self_mac_softap();

		} else if (strncmp(driver_req_ptr->nx_ip_driver_ptr->nx_ip_name, STA_INTERFACE,
				sizeof(STA_INTERFACE)) == 0) {
			nx_wifi_driver[i].interface_handle = network_open(STA_INTERFACE, station_callback);
			mac_address = get_self_mac_station();

		} else {
			driver_req_ptr->nx_ip_driver_status = NX_INVALID_INTERFACE;
			return;
		}

		driver_req_ptr->nx_ip_driver_interface->nx_interface_physical_address_lsw =
				(ULONG) ((mac_address[0] << 8) | (mac_address[1]));
		driver_req_ptr->nx_ip_driver_interface->nx_interface_physical_address_msw =
				(ULONG) ((mac_address[2] << 24) | (mac_address[3] << 16)
						| (mac_address[4] << 8) | (mac_address[5]));

		/* Indicate to the IP software that IP to physical mapping is required.  */
				nx_ip_interface_address_mapping_configure(driver_req_ptr->nx_ip_driver_ptr, nx_wifi_driver->nx_driver_id,
				NX_TRUE);
		/* In the RAM driver, just set the enabled flag.  */

		driver_req_ptr->nx_ip_driver_interface->nx_interface_link_up = NX_TRUE;

    /* USER CODE END NX_LINK_ENABLE */
        break;

    case NX_LINK_DISABLE:
    /* USER CODE BEGIN NX_LINK_DISABLE */

		/* In the RAM driver, just clear the enabled flag.  */
		driver_req_ptr->nx_ip_driver_interface->nx_interface_link_up = NX_FALSE;
    /* USER CODE END NX_LINK_DISABLE */
        break;

    case NX_LINK_ARP_SEND:
    /* USER CODE BEGIN NX_LINK_ARP_SEND */

    /* USER CODE END NX_LINK_ARP_SEND */
        break;

    case NX_LINK_ARP_RESPONSE_SEND:
    /* USER CODE BEGIN NX_LINK_ARP_RESPONSE_SEND */

    /* USER CODE END NX_LINK_ARP_RESPONSE_SEND */
        break;

    case NX_LINK_PACKET_BROADCAST:
    /* USER CODE BEGIN NX_LINK_PACKET_BROADCAST */

    /* USER CODE END NX_LINK_PACKET_BROADCAST */
        break;

    case NX_LINK_RARP_SEND:
    /* USER CODE BEGIN NX_LINK_RARP_SEND */

    /* USER CODE END NX_LINK_RARP_SEND */
        break;

    case NX_LINK_PACKET_SEND:
    /* USER CODE BEGIN NX_LINK_PACKET_SEND */
		/*
		 The IP stack sends down a data packet for transmission.
		 The device driver needs to prepend a MAC header, and fill in the
		 Ethernet frame type (assuming Ethernet protocol for network transmission)
		 based on the type of packet being transmitted.

		 The following sequence illustrates this process.
		 */

		/* Place the ethernet frame at the front of the packet.  */
		packet_ptr = driver_req_ptr->nx_ip_driver_packet;

		/* Adjust the prepend pointer.  */
		packet_ptr->nx_packet_prepend_ptr = packet_ptr->nx_packet_prepend_ptr
				- NX_ETHERNET_SIZE;

		/* Adjust the packet length.  */
		packet_ptr->nx_packet_length = packet_ptr->nx_packet_length
				+ NX_ETHERNET_SIZE;

		/* Setup the ethernet frame pointer to build the ethernet frame.  Backup another 2
		 bytes to get 32-bit word alignment.  */
		/*lint -e{927} -e{826} suppress cast of pointer to pointer, since it is necessary  */
		ethernet_frame_ptr = (ULONG*) (packet_ptr->nx_packet_prepend_ptr - 2);

		/* Build the ethernet frame.  */
		*ethernet_frame_ptr = driver_req_ptr->nx_ip_driver_physical_address_msw;
		*(ethernet_frame_ptr + 1) =
				driver_req_ptr->nx_ip_driver_physical_address_lsw;
		*(ethernet_frame_ptr + 2) =
				(driver_req_ptr->nx_ip_driver_interface->nx_interface_physical_address_msw << 16)
						| (driver_req_ptr->nx_ip_driver_interface->nx_interface_physical_address_lsw
								>> 16);
		*(ethernet_frame_ptr + 3) =
				(driver_req_ptr->nx_ip_driver_interface->nx_interface_physical_address_lsw << 16);

		if (driver_req_ptr->nx_ip_driver_command == NX_LINK_ARP_SEND) {
			*(ethernet_frame_ptr + 3) |= NX_ETHERNET_ARP;
		} else if (driver_req_ptr->nx_ip_driver_command
				== NX_LINK_ARP_RESPONSE_SEND) {
			*(ethernet_frame_ptr + 3) |= NX_ETHERNET_ARP;
		} else if (driver_req_ptr->nx_ip_driver_command == NX_LINK_RARP_SEND) {
			*(ethernet_frame_ptr + 3) |= NX_ETHERNET_RARP;
		} else if (packet_ptr->nx_packet_ip_version == 4) {
			*(ethernet_frame_ptr + 3) |= NX_ETHERNET_IP;
		}
		/*
		else {
			*(ethernet_frame_ptr + 3) |= NX_ETHERNET_IPV6;
		}
		*/
		struct pbuf buffer;
		buffer.len = (packet_ptr->nx_packet_append_ptr - packet_ptr->nx_packet_prepend_ptr);
		buffer.payload = (uint8_t *)ethernet_frame_ptr;

		/* Endian swapping if NX_LITTLE_ENDIAN is defined.  */
		NX_CHANGE_ULONG_ENDIAN(*(ethernet_frame_ptr));
		NX_CHANGE_ULONG_ENDIAN(*(ethernet_frame_ptr + 1));
		NX_CHANGE_ULONG_ENDIAN(*(ethernet_frame_ptr + 2));
		NX_CHANGE_ULONG_ENDIAN(*(ethernet_frame_ptr + 3));


		if (network_write(nx_wifi_driver[i].interface_handle, &buffer) == STM_OK) {
			driver_req_ptr->nx_ip_driver_status = NX_SUCCESS;
		} else {
			/*TODO - Handle packet send fail */
		}

    /* USER CODE END NX_LINK_PACKET_SEND */
        break;

    case NX_LINK_MULTICAST_JOIN:
    /* USER CODE BEGIN NX_LINK_MULTICAST_JOIN */
		/*  Unsupported feature.  */
		*(driver_req_ptr->nx_ip_driver_return_ptr) = 0;
    /* USER CODE END NX_LINK_MULTICAST_JOIN */
        break;

    case NX_LINK_MULTICAST_LEAVE:
    /* USER CODE BEGIN NX_LINK_MULTICAST_LEAVE */
		/* Return the link's line speed in the supplied return pointer. Unsupported feature.  */
		*(driver_req_ptr->nx_ip_driver_return_ptr) = 0;
    /* USER CODE END NX_LINK_MULTICAST_LEAVE */
        break;

    case NX_LINK_GET_STATUS:
    /* USER CODE BEGIN NX_LINK_GET_STATUS */
		/* Return the link's line speed in the supplied return pointer. Unsupported feature.  */
		*(driver_req_ptr->nx_ip_driver_return_ptr) = 0;
    /* USER CODE END NX_LINK_GET_STATUS */
        break;

    case NX_LINK_DEFERRED_PROCESSING:
    /* USER CODE BEGIN NX_LINK_DEFERRED_PROCESSING */

    /* USER CODE END NX_LINK_DEFERRED_PROCESSING */
        break;

#ifdef NX_ENABLE_INTERFACE_CAPABILITY
    case NX_INTERFACE_CAPABILITY_GET:
    /* USER CODE BEGIN NX_INTERFACE_CAPABILITY_GET */

    /* USER CODE END NX_INTERFACE_CAPABILITY_GET */
        break;

    case NX_INTERFACE_CAPABILITY_SET:
    /* USER CODE BEGIN NX_INTERFACE_CAPABILITY_SET */

    /* USER CODE END NX_INTERFACE_CAPABILITY_SET */
        break;
#endif /* NX_ENABLE_INTERFACE_CAPABILITY */

    default:
    /* USER CODE BEGIN DEFAULT */
		/* Unsupported feature.  */
		*(driver_req_ptr->nx_ip_driver_return_ptr) = 0;

    /* USER CODE END DEFAULT */
        break;
    }
}

    /* USER CODE BEGIN 2 */
void station_callback(struct network_handle *net_handle) {
	struct pbuf *rx_buffer = NULL;
	NX_PACKET packet;
		NX_PACKET *packet_ptr = &packet;

	//uint32_t sta_ip = 0;
	//int ret;
	int i;

	for (i = 0; i < MAX_INTERFACES; i++) {
		if (nx_wifi_driver[i].nx_network_driver_in_use == 0) {
			continue;
		}

		if (nx_wifi_driver[i].interface_handle != net_handle) {
			continue;
		}

		if (strncmp(nx_wifi_driver[i].nx_driver_ip_ptr->nx_ip_name,
				net_handle->ndev->name, sizeof(SOFTAP_INTERFACE)) == 0) {
			break;
		}
	}

	if (i == MAX_INTERFACES) {
		//driver_req_ptr->nx_ip_driver_status = NX_INVALID_INTERFACE;
		return;
	}

	rx_buffer = network_read(net_handle, 0);


		packet_ptr->nx_packet_prepend_ptr = rx_buffer->payload;
		packet_ptr->nx_packet_append_ptr = packet_ptr->nx_packet_prepend_ptr  + rx_buffer->len;
		packet_ptr->nx_packet_length = rx_buffer->len;
		packet_ptr->nx_packet_next = NULL;

		_nx_wifi_driver_receive(nx_wifi_driver[i].nx_driver_ip_ptr, packet_ptr, i);

}

void softap_callback(struct network_handle * net_handle) {
	struct pbuf *rx_buffer = NULL;
	int i = 0;
	//int ret;
	NX_PACKET packet;
	NX_PACKET *packet_ptr = &packet;
	rx_buffer = network_read(net_handle, 0);

	for (i = 0; i < MAX_INTERFACES; i++) {
		if (nx_wifi_driver[i].nx_network_driver_in_use == 0) {
			continue;
		}

		if (nx_wifi_driver[i].interface_handle != net_handle) {
			continue;
		}

		if (strncmp(nx_wifi_driver[i].nx_driver_ip_ptr->nx_ip_name,
				net_handle->ndev->name, sizeof(SOFTAP_INTERFACE)) == 0) {
			break;
		}
	}

	if (i == MAX_INTERFACES) {
		//driver_req_ptr->nx_ip_driver_status = NX_INVALID_INTERFACE;
		return;
	}

	rx_buffer = network_read(net_handle, 0);


	packet_ptr->nx_packet_prepend_ptr = rx_buffer->payload;
	packet_ptr->nx_packet_append_ptr = packet_ptr->nx_packet_prepend_ptr  + rx_buffer->len;
	packet_ptr->nx_packet_length = rx_buffer->len;
	packet_ptr->nx_packet_next = NULL;

	_nx_wifi_driver_receive(nx_wifi_driver[i].nx_driver_ip_ptr, packet_ptr, i);

}

void  _nx_wifi_driver_receive(NX_IP *ip_ptr, NX_PACKET *packet_ptr, UINT interface_instance_id)
{

UINT packet_type;

    /* Pickup the packet header to determine where the packet needs to be
       sent.  */
    packet_type =  (((UINT)(*(packet_ptr -> nx_packet_prepend_ptr + 12))) << 8) |
        ((UINT)(*(packet_ptr -> nx_packet_prepend_ptr + 13)));


    /* Setup interface pointer.  */
    packet_ptr -> nx_packet_address.nx_packet_interface_ptr = nx_wifi_driver[interface_instance_id].nx_interface_ptr;


    /* Route the incoming packet according to its ethernet type.  */
    /* The RAM driver accepts both IPv4 and IPv6 frames. */
    if (packet_type == NX_ETHERNET_IP)
    {

        /* Note:  The length reported by some Ethernet hardware includes bytes after the packet
           as well as the Ethernet header.  In some cases, the actual packet length after the
           Ethernet header should be derived from the length in the IP header (lower 16 bits of
           the first 32-bit word).  */

        /* Clean off the Ethernet header.  */
        packet_ptr -> nx_packet_prepend_ptr =  packet_ptr -> nx_packet_prepend_ptr + NX_ETHERNET_SIZE;

        /* Adjust the packet length.  */
        packet_ptr -> nx_packet_length =  packet_ptr -> nx_packet_length - NX_ETHERNET_SIZE;

        /* Route to the ip receive function.  */
#ifdef NX_DEBUG_PACKET
        printf("NetX RAM Driver IP Packet Receive - %s\n", ip_ptr -> nx_ip_name);
#endif

#ifdef NX_DIRECT_ISR_CALL
        _nx_ip_packet_receive(ip_ptr, packet_ptr);
#else
        _nx_ip_packet_deferred_receive(ip_ptr, packet_ptr);
#endif
    }
#ifndef NX_DISABLE_IPV4
    else if (packet_type == NX_ETHERNET_ARP)
    {

        /* Clean off the Ethernet header.  */
        packet_ptr -> nx_packet_prepend_ptr =  packet_ptr -> nx_packet_prepend_ptr + NX_ETHERNET_SIZE;

        /* Adjust the packet length.  */
        packet_ptr -> nx_packet_length =  packet_ptr -> nx_packet_length - NX_ETHERNET_SIZE;

        /* Route to the ARP receive function.  */
#ifdef NX_DEBUG
        printf("NetX RAM Driver ARP Receive - %s\n", ip_ptr -> nx_ip_name);
#endif
        _nx_arp_packet_deferred_receive(ip_ptr, packet_ptr);
    }
    else if (packet_type == NX_ETHERNET_RARP)
    {

        /* Clean off the Ethernet header.  */
        packet_ptr -> nx_packet_prepend_ptr =  packet_ptr -> nx_packet_prepend_ptr + NX_ETHERNET_SIZE;

        /* Adjust the packet length.  */
        packet_ptr -> nx_packet_length =  packet_ptr -> nx_packet_length - NX_ETHERNET_SIZE;

        /* Route to the RARP receive function.  */
#ifdef NX_DEBUG
        printf("NetX RAM Driver RARP Receive - %s\n", ip_ptr -> nx_ip_name);
#endif
        _nx_rarp_packet_deferred_receive(ip_ptr, packet_ptr);
    }
#endif /* !NX_DISABLE_IPV4  */
    else
    {

        /* Invalid ethernet header... release the packet.  */
        nx_packet_release(packet_ptr);
    }
}

    /* USER CODE END 2 */
