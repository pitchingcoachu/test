# GCU

## Workload

Within the Pitching suite’s Workload tab you now see acute-chronic ratios, live-pitch readiness ranges, and columns for the last 28 days of throws per player; intensity selection weights each throw, table cells color-code red/amber/green based on the chosen intensity (Live/Bullpen entries default to green), manual overrides persist in `data/workload_manual_entries.csv`, and the table refreshes automatically when that file changes.

## System prerequisites

The `install_packages.R` bootstrapper installs every R dependency listed in `install_packages.R`, starting with `shiny`. The deployment logs you shared show `shiny` failing because lower-level packages such as `otelsdk` and `rsvg` could not build on the target system—their source builds require system libraries that are not shipped with a bare GitHub Actions runner or minimal Linux container.

Before running the installer (locally or on CI) install the native libraries that `rsvg`/`shiny` and their dependencies rely on:

```sh
sudo apt-get update
sudo apt-get install -y \
  libssl-dev \
  libcurl4-openssl-dev \
  libxml2-dev \
  libfontconfig1-dev \
  libfreetype6-dev \
  libpng-dev \
  libjpeg-dev \
  libtiff5-dev \
  libcairo2-dev \
  libgdk-pixbuf2.0-dev \
  libpango1.0-dev \
  librsvg2-dev \
  pkg-config
```

These packages are typically already available on the `rocker` and hosted shinyapps.io servers, so you only need to install them manually on your CI runner (e.g., GitHub Actions). Once the native dependencies are present, rerunning `install_packages.R` should allow `otelsdk`, `rsvg`, and ultimately `shiny` to compile and install cleanly.
