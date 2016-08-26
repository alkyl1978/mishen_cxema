@ECHO OFF
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "C:\Surnmo_r\labels.tmp" -fI -W+ie -C V2E -o "C:\Surnmo_r\Surnmo_r.hex" -d "C:\Surnmo_r\Surnmo_r.obj" -e "C:\Surnmo_r\Surnmo_r.eep" -m "C:\Surnmo_r\Surnmo_r.map" "C:\Surnmo_r\Surnmo_r.asm"
