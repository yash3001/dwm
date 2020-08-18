#!/usr/bin/python

import optparse
import time

def get_args():
    parser = optparse.OptionParser()
    #parser.add_option("-x", "--x_bytes", dest ="xb", help = "Recieved bytes (rx) or Transmited bytes (tx)")
    parser.add_option("-d", "--dev", dest ="dev", help = "Device used in transmission (wlan0, wl01, eth0)")
    parser.add_option("-t", "--time", dest ="interval", help = "Time interval used for calulation in sec") 
    (options, arguments) = parser.parse_args()
    #if not options.xb:
    #    print('[-] Please specify whether rx or tx . For more details do --help ')
    #    return 0
    if not options.dev:
        print('[-] Please specify the device . For more details do --help ')
        return (0,0)
    elif not options.interval:
        print('[-] Please specify the time interval . For more details do --help ')
        return (0,0)
    else:
        return (options.dev, options.interval)

dev, interval = get_args()

if dev != 0 and interval !=0:
    path_rx = "/sys/class/net/{}/statistics/rx_bytes".format(dev)
    path_tx = "/sys/class/net/{}/statistics/tx_bytes".format(dev)
    f = open(path_rx, "r")
    rx_bytes_before = int(f.read())
    f.close()
    f = open(path_tx, "r")
    tx_bytes_before = int(f.read())
    f.close()
    
    time.sleep(float(interval))
    
    f = open(path_rx, "r")
    rx_bytes_after = int(f.read())
    f.close()
    f = open(path_tx, "r")
    tx_bytes_after = int(f.read())
    f.close()
    
    speed_rx = (rx_bytes_after-rx_bytes_before)/1000*float(interval)
    speed_tx = (tx_bytes_after-tx_bytes_before)/1000*float(interval)
    #print("{:.1f} kb/s".format(speed))
    print("{:.1f}kb/s {:.1f}kb/s".format(speed_rx, speed_tx))
