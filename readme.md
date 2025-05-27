

## Purpose of this repository

This repository holds YAML files that can generate conda environments that can be used to run my code.

## In brief

[Conda](https://docs.conda.io/projects/conda/en/stable/) is a package manager that allows you to automatically install packages. 
To set up a conda environment from a YAML file in this repository, install conda and download the YAML files (either clone this repository or manually download it first), and run

```conda env create -f <filename>.yaml -n <myname>```

which will create a YAML file from the YAML file called `<filename>.yaml` with the name `<myname>`.

See below for more details.

## More detailed background and explanation

### Libraries and dependencies 
To run scripts, you often depend on libraries or packages -- a collection of code written by someone else. Often, these packages have dependencies. For example, you need library A and B, but library A also requires library C and D to run. In turn, library D might even need libraries E and F, and so on. Unfortunately, sometimes a problem comes up. For example, you now need library X for a specific task. But library X requires version 1.23 of library B, whilst library A requires version 3.21 of library B. So now, you can't install library A and X together.

### Managing libraries and create environments
To disentangle the web of dependencies that can arise, there's software that manages libraries. [Conda](https://docs.conda.io/projects/conda/en/stable/) is an example of this, it is a piece of software that manages installation and dependencies of libraries. Moreover, it allows you to create environments. Multiple environments could be seen as multiple virtual computers, such that you can install library A in one environment, and library X in another, without their mutually exclusive dependencies causing issues. Conda will also figure out which combination of library versions need to be installed for you to install multiple libraries together. In reality, conda creates a separate directory on your computer for each of the environments, and once you activate an environment, calling e.g. python will refer you to the python installation and installed libraries in that directory. 

### Installing conda

You can choose between anaconda and miniconda. Anaconda comes with many things pre-installed, whilst miniconda offers all essential conda features without additional features. Anaconda also comes with a convenient GUI (graphical user interface).

To install anaconda or miniconda, see https://docs.anaconda.com/anaconda/install/, where you can click a "download" button at the top. (You can skip email registration if you want.) By scrolling down, you can choose between anaconda or miniconda. 

#### Installing miniconda easily

See: https://docs.anaconda.com/miniconda/install/#quick-command-line-install

Mamba, a much faster implementation of conda, which has exactly the same functionalities (just replace `conda` in your commands with `mamba`), can be installed using https://anaconda.org/conda-forge/mamba. Conda should however nowadays use mamba libraries per default (see e.g. https://www.reddit.com/r/Python/comments/1ae2xie/conda_now_uses_libmamba_by_default/?rdt=33453).

#### A note about anaconda

It's unclear whether Anaconda can be used for free at academic institutes;
See: https://www.cdotrends.com/story/4173/anaconda-threatens-legal-action-over-licensing-terms
Conda supposedly is free.

See also:
https://www.anaconda.com/blog/update-on-anacondas-terms-of-service-for-academia-and-research

TO DO: Check this information properly.

### Setting up an environment

See https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html on how to create and manage environments. 

A few convenient commands 
- `conda create --name <my-env>` initializes a new environment called `<my-env>`
- `conda activate <my-env>` activates the environment called `<my-env>`
- `conda env list` lists all available environments
- `conda install <channel-name>::<package-name>` installs package `<package-name>` from channel `<channel-name>`, `<channel-name>::` can be ommitted to look in default channels. (Channels are basically online databases that hold and manage packages that people wrote.)

### Setting up environments from yaml files

YAML files hold a list of packages that can be installed. In this repository you will find a few. To set up environments this way, simply use:

```conda env create -f <environment-yaml-file>```

E.g.

```conda env create -f 2024_FLIM.yaml```

will set up the environment 2024_FLIM. The name of this environment is determined by information within the YAML file. To assign a custom name, use e.g.:

```conda env create -f 2024_FLIM.yaml -n my_FLIM_environment```

which will set up an environment called my_FLIM_environment, using information from the `2024_FLIM.yaml` file.

# Notes about some of these environments

- 2024_FLIM is an environment which ran FLIM-related python modules on my old machine. I exported the conda file to 2024_FLIM.yaml. However, running `conda env create -f 2024_FLIM.yaml` didn't work, as not all packages were available any more. I therefor created `2024_FLIMb.yaml`, which has version specifications removed, and some packages removed.
