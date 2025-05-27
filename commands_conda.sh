

###
# Fixing FLIM environment
#
# 2024_FLIM was broken, recreated it and set it up under 2025_FLIM
conda env export --name 2024_FLIM > 2024_FLIM.yml
# (Search + replaced "=.*\n" for "\n" to remove version requirements --> created 2024_FLIM_noversions.yml)
conda env create --file 2024_FLIM_noversions.yml --name 2025_FLIM --no-pin
