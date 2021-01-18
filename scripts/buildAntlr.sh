#!/bin/zsh

basedir=$(dirname "$0")

AntlrJar="$basedir""/../scripts/antlr-4.9.1-complete.jar"

ProjectDirectory="$basedir/../JsonParser"
GrammarDirectory=$ProjectDirectory"/Antlr"
OutputDirectory=$GrammarDirectory"/generated"

rm -rf "$OutputDirectory/*.interp" "$OutputDirectory/*.tokens"

java \
  -jar "$AntlrJar" \
  -Xexact-output-dir \
  -Dlanguage=CSharp \
  -o "$OutputDirectory" \
  "$GrammarDirectory"/*.g4

mv "$OutputDirectory"/*.{tokens,interp} "$GrammarDirectory"
