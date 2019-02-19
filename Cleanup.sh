#!/bin/bash

set +v

echo
echo "Running cleanup procedures; press CTRL+C to exit now. Otherwise..."
read -n1 -r -p "Press any key to continue..."

rm Output.elf
rm output.map

rm *.o
rm *.d
rm *.out

echo
echo "Done! All clean."
echo
