#!/bin/bash
ls -lrta /var/www/html/dist/my-pizza-order-online
sudo systemctl start nginx
sudo systemctl status nginx
