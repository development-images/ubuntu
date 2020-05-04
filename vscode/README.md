# VS Code Ubuntu Containers

The following images are for use as VS Code base containers:

* `registry.gitlab.com/development-images/ubuntu/vscode:base`: Minimal VS Code image without additional language support
* `registry.gitlab.com/development-images/ubuntu/vscode:latest`: Common language support (Perl, Python, PHP, Shell and Ruby)

For more trimmed down images, the following are specific language containers:

* `registry.gitlab.com/development-images/ubuntu/vscode/lang:python`: Python language support
* `registry.gitlab.com/development-images/ubuntu/vscode/lang:perl`: Perl language support
* `registry.gitlab.com/development-images/ubuntu/vscode/lang:php`: PHP language support
* `registry.gitlab.com/development-images/ubuntu/vscode/lang:shell`: Shell language support

## Dev Container Templates

Template VS code workspace directories are available here:

* [Common](templates/common/): Common extension setup for Perl, Python, PHP, Shell and Ruby
* [Python](templates/python/): Extension setup for Python
* [Perl](templates/perl/): Extension setup for Perl
* [PHP](templates/php/): Extension setup for PHP
* [Shell](templates/shell/): Extension setup for Shell
