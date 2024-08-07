# Puppet development environment
# hadolint global ignore=DL3008

## Create arg for release
ARG RELEASE

## Create default arg for the registry path to pull base image from
ARG REGISTRY_PATH="registry.remote.sx/development-images/ubuntu"

## Use base image
# hadolint ignore=DL3007
FROM ${REGISTRY_PATH}/ruby/${RELEASE}:latest

## Inherit RELEASE arg
ARG RELEASE

## The puppet release to use for puppet packages
ARG PUPPET_VERSION="8"

## The suite name to use for puppet packages
## Currently this fails as there are no package available for Ubuntu Noble for PDK and puppet-bolt.
#ARG PUPPET_SUITE="$RELEASE"
ARG PUPPET_SUITE="jammy"

## Switch to root for Puppet installation
USER root

## Install gems that will be used
# hadolint ignore=DL3028
RUN gem install \
    r10k solargraph puppet-debugger hiera-eyaml

## Add the package sources file
COPY <<EOF /etc/apt/sources.list.d/puppet.sources
# Puppet ${PUPPET_VERSION} Package Repository
Types: deb
URIs: http://apt.puppetlabs.com
Suites: ${PUPPET_SUITE}
Components: puppet${PUPPET_VERSION}
Description: Puppet ${PUPPET_VERSION} package repository
Signed-By:
    -----BEGIN PGP PUBLIC KEY BLOCK-----
    .
    mQINBFyrv4oBEADhL8iyDPZ+GWN7L+A8dpEpggglxTtL7qYNyN5Uga2j0cusDdOD
    ftPHsurLjfxtc2EFGdFK/N8y4LSpq+nOeazhkHcPeDiWC2AuN7+NGjH9LtvMUqKy
    NWPhPYP2r/xPL547oDMdvLXDH5n+FsLFW8QgATHk4AvlIhGng0gWu80OqTCiL0HC
    W7TftkF8ofP8k90SnLYbI9HDVOj6VYYtqG5NeoCHGAqrb79G/jq64Z/gLktD3IrB
    CxYhKFfJtZ/BSDB8Aa4ht+jIyeFCNSbGyfFfWlHKvF3JngS/76Y7gxX1sbR3gHJQ
    hO25AQdsPYKxgtIgNeB9/oBp1+V3K1W/nta4gbDVwJWCqDRbEFlHIdV7fvV/sqiI
    W7rQ60aAY7J6Gjt/aUmNArvT8ty3szmhR0wEEU5/hhIVV6VjS+AQsI8pFv6VB8bJ
    TLfOBPDW7dw2PgyWhVTEN8KW/ckyBvGmSdzSgAhw+rAe7li50/9e2H8eiJgBbGid
    8EQidZgkokh331CMDkIA6F3ygiB+u2ZZ7ywxhxIRO70JElIuIOiofhVfRnh/ODlH
    X7eD+cA2rlLQd2yWf4diiA7C9R8r8vPrAdp3aPZ4xLxvYYZV8E1JBdMus5GRy4rB
    Avetp0Wx/1r9zVDKD/J1bNIlt0SR9FTmynZj4kLWhoCqmbrLS35325sS6wARAQAB
    tEhQdXBwZXQsIEluYy4gUmVsZWFzZSBLZXkgKFB1cHBldCwgSW5jLiBSZWxlYXNl
    IEtleSkgPHJlbGVhc2VAcHVwcGV0LmNvbT6JAlQEEwEKAD4WIQTWgR7Tre64RBr1
    qo9FKLbNnmHvJgUCXKu/igIbAwUJC0c1AAULCQgHAwUVCgkICwUWAgMBAAIeAQIX
    gAAKCRBFKLbNnmHvJg/vD/0eOl/pBb6ooGnzg2qoD+XwgOK3HkTdvGNZKGsIrhUG
    q6O0zoyPW8v9b/i7QEDre8QahARmMAEQ+T3nbNVzw4kpE+YIrEkKjoJsrF8/K/1L
    zBHJCc3S9oF9KubG5BuQ4bAmcvnI+qpEYbSTLHztYGUfXAGu+MnaDf4C60G7zM6m
    ec4bX8lVnt+gcsGGGCdN89XsZLBNdv21z9xMeaAPiRYJpbqwrb8cYbKQeqFSQt2M
    UylN5oVeN77Q8iyXSyVwpc6uKzXdQ8bVPbKUTWSXQ4SSp0HJjtAMiDH2pjty4PG6
    EgZ6/njJLOzQ29ZgFrS19XLONlptHwKzLYB8nJhJvGHfzzInmNttDtNwTA6IxpsR
    4aCnrPWFJRCbmMBNXvBR9B/O+e/T5ngL21ipMEwzEOiQlRSacnO2pICwZ5pARMRI
    dxq/5BQYry9HNlJDGR7YIfn7i0oCGk5BxwotSlAPw8jFpNU/zTOvpQAdPvZje2JP
    6GS+hYxSdHsigREXI2gxTvpcLk8LOe9PsqJv631e6Kvn9P9OHiihIp8G9fRQ8T7y
    elHcNanV192mfbWxJhDAcQ+JEy9883lOanaCoaf/7z4kdmCQLz5/oNg2K0qjSgZH
    JY/gxCOwuAuUJlLcAXQG6txJshfMxyQUO46DXg0/gjwkKgT/9PbTJEN/WN/G6n1h
    lbkCDQRcq7+KARAAxX5WS3Qx0eHFkpxSecR2bVMh5NId/v5Ch0sXWTWp44I38L9V
    o+nfbI+o8wN5IdFtvhmQUXCUPfacegFVVyerxSuLb0YibhNL1/3xwD5aDMYSN5ud
    x1wJTN1Ymi1zWwDN0PMx3asJ2z31fK4LOHOP4gRvWfrJjYlkMD5ufmxK7bYWh80z
    IEHJkNJKGbGcBB8MxJFP1dX85vwATY7N7jbpBQ0z6rLazfFyqmo8E3u5PvPQvJ06
    qMWF1g+tTqqJSIT6kdqbznuWNGFpI0iO+k4eYAGcOS2L8v5/Au163BldDGHxTnnl
    h42MWTyx7v0UBHKvI+WSC2rQq0x7a2WyswQ9lpqGbvShUSyR8/z6c0XEasDhhB3X
    AQcsIH5ndKzS7GnQMVNjgFCyzr/7+TMBXJdJS3XyC3oi5yTX5qwt3RkZN1DXozkk
    eHxzow5eE7cSHFFYboxFCcWmZNeHL/wQJms0pW2UL2crmXhVtj5RsG9fxh0nQnxm
    zrMbn+PxQaW8Xh+Z5HWQ65PSt7dg8k4Y+pGD115/kG1U2PltlcoOLUwHLp24ptaa
    Chj1tNg/VSWpMCaXeDmrk5xiZIRHe/P1p18+iTOQ2GXP4MBmfDwX9lHfQxTht/qB
    +ikBy4bVqJmMDew4QAmHgPhRXzRwTH4lIMoYGPX3+TAGovdy5IZjaQtvahcAEQEA
    AYkCPAQYAQoAJhYhBNaBHtOt7rhEGvWqj0Uots2eYe8mBQJcq7+KAhsMBQkLRzUA
    AAoJEEUots2eYe8m/ggQAMWoPyvNCEs1HTVpOOyLsEbQhLvCcjRjJxHKGg9z8nIW
    pFSPXjlThnRR3UwIQHVgf+5OYMvIvaQ5yLWLMP1QdN/wZLKHLaKv6QxgXdLmr3F5
    9qhoV3NbBvgkFlzvJrHYH75sJglX60W7QysXxYinlsPhQeTWjca5/VjUTOgGhLDM
    Q/UCClcPA0Q12Q7U/eomYnmFDJdxPH6U9ZA6UQTdLWVCvK1chL3Fj1eq/11d/0S/
    7CQvZObYRKX1kkaJAwSt7C6iq8nvrCWVVuxaXRqI/6Qi4Z6CSNB+2tk2W66J52Wm
    PaodvnLlu+im3qtTWLLa3R+ZFRwNK9xPIR+XbA/HggOkG/JeAZYgB8shIVhuPdQc
    zZi2hHIVUTPvhnxNgeioia2Zu++2WKpf6LEGNlwADFOVedfea0am23ImV2YOhEHz
    hSvhdhiM3W8XtK3ZQbyUiumAXQrMhamoaHytdQUMEU/nmaLygKPHjUNixsliknU6
    jxFIQStHSuF3b2hdM3W+Cw8ziUInpz5Dgw9uV0G3h/FGv0tjjgmbyTdUIjbQNUxk
    pzA2H6IBEMaVTdNuGEqPU+xySSoOSU3eg3Hey4hR1CZln5cky0bwZRziCQYmfpn1
    KE7aoxDPbBBJ0Y3k/i8CfnPiaBeWY+3o63Z9IeICg17nNva8OYpQnUVXXHhkJIc0
    =u0aK
    -----END PGP PUBLIC KEY BLOCK-----
EOF

## Update package sources and install puppet packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        puppet-agent pdk puppet-lint puppetserver puppet-bolt \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

## Switch back to vscode user
USER vscode

## Create PDK configuration directory and Puppet configuration directory
RUN mkdir -p /home/vscode/.config/puppet /home/vscode/.puppetlabs/etc/puppet

## Disable analytics
COPY <<-EOF /home/vscode/.config/puppet/analytics.yml
---
disabled: true
EOF
