#!/bin/bash

export LOG=~/WORK/test-build2/zerkalo2.log 
cd ~/WORK/test-build2
echo "--------------- START ---------------" >> $LOG
echo $(date +"%F %H:%M:%S") >> $LOG
echo "---- sync start ----" >> $LOG
make sync >> $LOG
echo "---- build start ----" >> $LOG
make build >> $LOG
echo "---- deploy start ----" >> $LOG
make deploy >> $LOG
echo "--------------- END ---------------" >> $LOG
