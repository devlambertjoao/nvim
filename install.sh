#!/bin/bash
npm install --prefix lsp/angularls
npm install --prefix lsp/vscode
npm install --prefix lsp/typescript

rm -r lsp/clangd/linux-x64
rm -r lsp/clangd/macos-arm
rm -r lsp/clangd/windows

unzip -uo lsp/clangd/linux-x64.zip -d lsp/clangd/
unzip -uo lsp/clangd/macos-arm.zip -d lsp/clangd/

