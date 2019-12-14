#!/bin/bash

echo ""
echo "Zipando pastas"
echo ""

cd themes

echo "Apagando arquivos"
rm id-rio.tar.gz

echo "Criando id-rio.tar.gz"
tar -czf id-rio.tar.gz id-rio

echo ""
echo "Done"
echo ""
