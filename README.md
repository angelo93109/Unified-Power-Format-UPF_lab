# Unified-Power-Format-UPF_Notes
This repository contains the my learning notes of UPF command and the example design I made. 

## Three Crucial Elememts of UPF
1. Power Network (e.g. port, net, connection)
2. Power Policy (e.g. Isolation, Retention, Power Switch, Level Shifter, Always-ON)
3. Power State (PST)

The main purpose of UPF is to save the static power consumption (leakage) of the design. 

### Definition and Purpose of each power policy
<ins>1. Isolation </ins> 
    Ensure the output of the power off (CORRUPT) domain does not propagate unknown signal to the rest of the design. Instead, it will clamp a constant value (0 or 1) to substitute the corrupted output. \ 
<ins>2. Retention </ins> 
<ins>3. Power Switch </ins> 
<ins>4. Power State Table </ins> 
