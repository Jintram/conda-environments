
###
# After a macOS update, many environments were broken, so I had to re-install them


###
# Fixing FLIM environment
#
# 2024_FLIM was broken, recreated it and set it up under 2025_FLIM
conda env export --name 2024_FLIM > 2024_FLIM.yml
# (Search + replaced "=.*\n" for "\n" to remove version requirements --> created 2024_FLIM_noversions.yml)
conda env create --file 2024_FLIM_noversions.yml --name 2025_FLIM --no-pin



###
# Fixing 2025_Haase environment
#
# 2025_Haase was broken, recreated it and set it up under 2025_Haase
conda env export --name 2025_Haase > 2025_Haase.yml
# (Search + replace "=.*\n" for "\n" to remove version requirements
sed 's/=.*$//' 2025_Haase.yml > 2025_Haase_noversions.yml
# Rename the old environment
conda activate base
conda rename -n 2025_Haase 2025_Haase_broken
# Install the new environment
conda env create --file 2025_Haase_noversions.yml --name 2025_Haase
# Remove broken env if desired
conda env remove --name 2025_Haase_broken
