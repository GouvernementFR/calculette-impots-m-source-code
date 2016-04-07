# Code source des impôts sur les revenus

## Contenu

Les fichiers contenus dans l'archive sont l'ensemble des fichiers de paramétrage utilisés par les services informatiques de la Direction Générale des Finances Publiques pour réaliser la taxation des foyers fiscaux (IR, ISF, CSG).

Ces fichiers sont développés sous licence CeCILL 2.1 soumise au droit français et respectant les principes de diffusion des logiciels libres.

Cette version est la 2.5 qui a servi au cours de l'année 2015 pour produire les avis d'impôt sur les revenus 2014.

Les fichiers contenus dans le répertoire `src` sont :

- [`tgvH.m`](src/tgvH.m) : Tableau général des variables qui assure la correspondance entre les codes issus de la 2042 et les variables internes au calcul, les variables de calcul et les variables restituées par la calculette IR
- [`errH.m`](src/errH.m) : Fichier décrivant les différentes anomalies
- `coiX.m`, `cocX.m`, [`horizoc.m`](src/horizoc.m), [`horizoi.m`](src/horizoi.m) : Fichiers de gestion des anomalies de la calculette
- `chap-X.m`, [`res-ser1.m`](src/res-ser1.m), [`res-ser2.m`](src/res-ser2.m) : Fichiers comportant les différentes règles de calcul pour un ensemble fonctionnel cohérent.

## The missing manual

Cette section contient des informations devinées en lisant les fichiers du code source, durant le processus d'écriture du [parser](https://git.framasoft.org/openfisca/calculette-impots-m-language-parser) et du [compilateur en Python](https://git.framasoft.org/openfisca/calculette-impots-python).

Un tag `FIXME` est placé lorsqu'une information est manquante et qu'il faut la compléter.

### Applications

Les règles déclarées sont qualifiées par un ou plusieurs noms d'application.

Exemple :

```impots-m
regle 700:
application : bareme , iliad , batch  ;
pour z=1,2:
RB5z = max( 0, RB0z + TETONEQUO1) ;
RB55 = max( 0, RB05 + TETONEQUOM1) ;
```

Les applications identifiées jusque là sont :

- `batch` est utilisée pour le calcul primitif de l'impôt
- `iliad` est utilisée pour le calcul correctif de l'impôt
- `FIXME` les autres applications

### Variables

Les variables sont de plusieurs types :

- Les variables saisies correspondent aux cases de la déclaration des revenus (par exemple `1AJ`).
- Les variables calculées ont une formule qui renvoie la valeur de la variable.
- Les variables calculées de base sont des variables qui peuvent être affectées avant le début du calcul.

Le fichier [`tgvH.m`](src/tgvH.m) définit des variables via plusieurs champs qui varient selon le type.

Exemples :

```impots-m
10MINS1 : calculee : "deductions hors droits d'auteur plafonnees" ;
10MINS1TOUT : calculee base : "10 pourcent TS dernier evt pour calcul de DEFRI" ;
4BACREP : saisie revenu classe = 2 priorite = 10 categorie_TL = 20 cotsoc = 5 ind_abat = 0 acompte = 1 avfisc = 0 rapcat = 8 sanction = 2 nat_code = 0 alias CJC : "BA exceptionnels sous CGA - Quotient 4 - PAC" ;
```

### Formules

Quelques exemples de fichiers contenant des formules :

- [`chap-1.m`](src/chap-1.m) contient les règles de calcul du montant net à payer
- [`chap-2.m`](src/chap-2.m) contient les règles de calcul du montant net à payer
- [`chap-51.m`](src/chap-51.m) contient les règles de calcul des droits simples résultant du taux progressif
- [`chap-55.m`](src/chap-55.m) contient les règles de calcul des droits simples résultant du taux progressif
- [`chap-6.m`](src/chap-6.m) contient les règles de calcul du nombre de parts
- [`chap-isf.m`](src/chap-isf.m) contient les règles de calcul de l'ISF
- [`chap-perp.m`](src/chap-perp.m) contient les règles de calcul des déductions pour verserment sur un Plan d'Epargne Retraite Populaire

### Erreurs

Le fichier [`errH.m`](src/errH.m) définit des erreurs via plusieurs champs :

- `code` (`string`, unique) : le code unique de l'erreur
- `type` (`enum(anomalie, discordance, informative)`) : le type d'erreur
- `type_code` (`enum(A, D, I)`) : le code du type d'erreur (semble redondant avec `type`)

Exemple :

```impots-m
A000:anomalie :"A":"000":"00":"SAISIE D UN MONTANT NEGATIF":"N";
```

### Vérifications

- [`coi1.m`](src/coi1.m) déclenche uniquement des erreurs de type `discordance`
- [`coi2.m`](src/coi2.m) et [`coi3.m`](src/coi3.m) déclenchent uniquement des erreurs de type `informative`
- `coc*.m` déclenchent uniquement des erreurs de type `anomalie`
- [`horizoc.m`](src/horizoc.m) et [`horizoi.m`](src/horizoi.m) déclenchent uniquement des erreurs de type `anomalie`, et les vérifications concernent uniquement l'application `iliad`

### Variables remarquables

Variables calculées :

- `IRN` : Impot net ou restitution nette

Variables saisies :

- `TSHALLOV` (`1AJ`) : Salaires - Declarant 1

### Questions métier

- qu'est-ce que le calcul correctif horizontal ? (cf `horizoc.m`: `verif corrective horizontale 760`)
