#!/bin/bash
# Turvallinen siivous - poistaa salasanatiedostot ja muut arkaluontoiset tiedot
# Suorita tämä skripti, kun olet kirjautunut ArgoCD:hen ja tallentanut salasanan turvallisesti.

echo "🧹 Siivotaan arkaluontoiset tiedot..."

# 1. Poista salasanatiedostot
if [ -f /tmp/argocd-admin-password.txt ]; then
    echo "Poistetaan salasanatiedosto..."
    shred -u /tmp/argocd-admin-password.txt 2>/dev/null || rm -f /tmp/argocd-admin-password.txt
fi

# 2. Tyhjennä shell-historia (vain ArgoCD-komennot)
if [ -f ~/.bash_history ]; then
    echo "Tyhjennetään ArgoCD-komennot historiasta..."
    grep -v "argocd.*password" ~/.bash_history > ~/.bash_history.tmp
    mv ~/.bash_history.tmp ~/.bash_history
fi

# 3. Tyhjennä kubectl-cache
if [ -d ~/.kube/cache ]; then
    echo "Tyhjennetään kubectl-cache..."
    rm -rf ~/.kube/cache/*
fi

echo ""
echo "✅ Siivous valmis!"
echo "🔒 Kaikki arkaluontoiset tiedot on poistettu."
echo "💡 Muista tyhjentää myös terminaalin historia manuaalisesti tarvittaessa: history -c"
