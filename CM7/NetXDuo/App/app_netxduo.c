/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    app_netxduo.c
  * @author  MCD Application Team
  * @brief   NetXDuo applicative file
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2020-2021 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "app_netxduo.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

#define PAYLOAD_SIZE             1536
#define NX_PACKET_POOL_SIZE      (( PAYLOAD_SIZE + sizeof(NX_PACKET)) * 10)
#define WINDOW_SIZE              512

#define DEFAULT_MEMORY_SIZE      1024
#define DEFAULT_PRIORITY         10

#define NULL_ADDRESS             0

#define DEFAULT_PORT             6000
#define TCP_SERVER_PORT          6001
#define TCP_SERVER_ADDRESS       IP_ADDRESS(192, 168, 1, 1)

#define MAX_PACKET_COUNT         100
#define DEFAULT_MESSAGE          "TCP Client on STM32H723-Nucleo"
#define DEFAULT_TIMEOUT          10 * NX_IP_PERIODIC_RATE
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
/* USER CODE BEGIN PV */
TX_THREAD AppMainThread;
TX_THREAD AppTCPThread;

TX_SEMAPHORE Semaphore;

NX_PACKET_POOL AppPool;

ULONG IpAddress;
ULONG NetMask;
NX_IP IpInstance;

NX_DHCP DHCPClient;
NX_TCP_SOCKET TCPSocket;

CHAR *pointer;
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
/* USER CODE BEGIN PFP */
static VOID App_Main_Thread_Entry(ULONG thread_input);

static VOID ip_address_change_notify_callback(NX_IP *ip_instance, VOID *ptr);
/* USER CODE END PFP */
/**
  * @brief  Application NetXDuo Initialization.
  * @param memory_ptr: memory pointer
  * @retval int
  */
UINT MX_NetXDuo_Init(VOID *memory_ptr)
{
  UINT ret = NX_SUCCESS;
  TX_BYTE_POOL *byte_pool = (TX_BYTE_POOL*)memory_ptr;

  /* USER CODE BEGIN MX_NetXDuo_MEM_POOL */
  (void)byte_pool;
  /* USER CODE END MX_NetXDuo_MEM_POOL */

  /* USER CODE BEGIN MX_NetXDuo_Init */
  /* Allocate the memory for packet_pool.  */
   if (tx_byte_allocate(byte_pool, (VOID **) &pointer,  NX_PACKET_POOL_SIZE, TX_NO_WAIT) != TX_SUCCESS)
   {
     return TX_POOL_ERROR;
   }

   /* Create the Packet pool to be used for packet allocation */
   ret = nx_packet_pool_create(&AppPool, "Main Packet Pool", PAYLOAD_SIZE, pointer, NX_PACKET_POOL_SIZE);

   if (ret != NX_SUCCESS)
   {
     return NX_NOT_ENABLED;
   }

   /* Allocate the memory for Ip_Instance */
   if (tx_byte_allocate(byte_pool, (VOID **) &pointer,   2 * DEFAULT_MEMORY_SIZE, TX_NO_WAIT) != TX_SUCCESS)
   {
     return TX_POOL_ERROR;
   }

   /* Create the main NX_IP instance */
   ret = nx_ip_create(&IpInstance, SOFTAP_INTERFACE, NULL_ADDRESS, NULL_ADDRESS, &AppPool,nx_stm32_custom_driver,
                      pointer, 2 * DEFAULT_MEMORY_SIZE, DEFAULT_PRIORITY);

   if (ret != NX_SUCCESS)
   {
     return NX_NOT_ENABLED;
   }

   /* Allocate the memory for ARP */
   if (tx_byte_allocate(byte_pool, (VOID **) &pointer, DEFAULT_MEMORY_SIZE, TX_NO_WAIT) != TX_SUCCESS)
   {
     return TX_POOL_ERROR;
   }

   /*  Enable the ARP protocol and provide the ARP cache size for the IP instance */
   ret = nx_arp_enable(&IpInstance, (VOID *)pointer, DEFAULT_MEMORY_SIZE);

   if (ret != NX_SUCCESS)
   {
     return NX_NOT_ENABLED;
   }

   /* Enable the ICMP */
    ret = nx_icmp_enable(&IpInstance);

    if (ret != NX_SUCCESS)
    {
      return NX_NOT_ENABLED;
    }

    /* Enable the UDP protocol required for  DHCP communication */
    ret = nx_udp_enable(&IpInstance);

    if (ret != NX_SUCCESS)
    {
      return NX_NOT_ENABLED;
    }

    /* Enable the TCP protocol */
    ret = nx_tcp_enable(&IpInstance);

    if (ret != NX_SUCCESS)
    {
      return NX_NOT_ENABLED;
    }

    /* Allocate the memory for main thread   */
    if (tx_byte_allocate(byte_pool, (VOID **) &pointer,2 *  DEFAULT_MEMORY_SIZE, TX_NO_WAIT) != TX_SUCCESS)
    {
      return TX_POOL_ERROR;
    }

   /* Allocate the memory for main thread   */
    if (tx_byte_allocate(byte_pool, (VOID **) &pointer,2 *  DEFAULT_MEMORY_SIZE, TX_NO_WAIT) != TX_SUCCESS)
    {
      return TX_POOL_ERROR;
    }

    /* Create the main thread */
    ret = tx_thread_create(&AppMainThread, "App Main thread", App_Main_Thread_Entry, 0, pointer, 2 * DEFAULT_MEMORY_SIZE,
                           DEFAULT_PRIORITY, DEFAULT_PRIORITY, TX_NO_TIME_SLICE, TX_AUTO_START);

    if (ret != TX_SUCCESS)
    {
      return NX_NOT_ENABLED;
    }

#if 0
    /* Allocate the memory for TCP server thread   */
    if (tx_byte_allocate(byte_pool, (VOID **) &pointer,2 *  DEFAULT_MEMORY_SIZE, TX_NO_WAIT) != TX_SUCCESS)
    {
      return TX_POOL_ERROR;
    }

    /* create the TCP server thread */
    ret = tx_thread_create(&AppTCPThread, "App TCP Thread", App_TCP_Thread_Entry, 0, pointer, 2 * DEFAULT_MEMORY_SIZE,
                           DEFAULT_PRIORITY, DEFAULT_PRIORITY, TX_NO_TIME_SLICE, TX_DONT_START);

    if (ret != TX_SUCCESS)
    {
      return NX_NOT_ENABLED;
    }
#endif

    /* create the DHCP client */
    ret = nx_dhcp_create(&DHCPClient, &IpInstance, "DHCP Client");

    if (ret != NX_SUCCESS)
    {
      return NX_NOT_ENABLED;
    }

    /* set DHCP notification callback  */

    tx_semaphore_create(&Semaphore, "App Semaphore", 0);
  /* USER CODE END MX_NetXDuo_Init */

  return ret;
}

/* USER CODE BEGIN 1 */
/**
* @brief  Main thread entry.
* @param thread_input: ULONG user argument used by the thread entry
* @retval none
*/
static VOID App_Main_Thread_Entry(ULONG thread_input)
{
  UINT ret;

  ret = nx_ip_address_change_notify(&IpInstance, ip_address_change_notify_callback, NULL);
  if (ret != NX_SUCCESS)
  {
    Error_Handler();
  }

  ret = nx_dhcp_start(&DHCPClient);
  if (ret != NX_SUCCESS)
  {
    Error_Handler();
  }

  /* wait until an IP address is ready */
  if(tx_semaphore_get(&Semaphore, TX_WAIT_FOREVER) != TX_SUCCESS)
  {
    Error_Handler();
  }

  ret = nx_ip_address_get(&IpInstance, &IpAddress, &NetMask);

  if (ret != TX_SUCCESS)
  {
    Error_Handler();
  }

  //PRINT_IP_ADDRESS(IpAddress);


  /* the network is correctly initialized, start the TCP server thread */
#if 0
  tx_thread_resume(&AppTCPThread);
#endif
  /* this thread is not needed any more, relinquish it */
  tx_thread_relinquish();

  return;
}

/**
* @brief  IP Address change callback.
* @param ip_instance: NX_IP instance registered for this callback.
* @param ptr: VOID* user data pointer
* @retval none
*/
static VOID ip_address_change_notify_callback(NX_IP *ip_instance, VOID *ptr)
{
  tx_semaphore_put(&Semaphore);
}
/* USER CODE END 1 */
