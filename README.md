# Emacs XML Hide

Emacs XML Hide is a package for Emacs that allows you to hide XML tags in a buffer, displaying only the text contents enclosed in the tags. This can be useful when working with XML files and you want to focus on the text content without the distraction of the tags.

## Installation

Clone this repository to your Emacs configuration directory (e.g., `~/.emacs.d/`):

```sh
git clone https://github.com/brunocbr/emacs-xml-hide.git ~/.emacs.d/emacs-xml-hide
```

Then, add the following to your Emacs configuration file (e.g., `~/.emacs` or `~/.emacs.d/init.el`):

```emacs-lisp
(add-to-list 'load-path "~/.emacs.d/emacs-xml-hide")
(require 'xml-hide)
```

## Usage

To use Emacs XML Hide, activate `xml-hide-mode` in a buffer containing XML content. You can do this by running `M-x xml-hide-mode`. Once activated, use `C-c C-h h` to hide the XML tags and `C-c C-h s` to show them again.

You can customize the replacement string used for the hidden XML tags by customizing the `xml-hide-replacement-string` variable. Use `M-x customize-variable RET xml-hide-replacement-string RET` to customize it.

## License

This package is licensed under the MIT License. See the LICENSE file for details.

