# Dossier Projet

## Sommaire:
- Présentation
- Résumé
- Présentation de l'entreprise
    - Explication de la structure
    - Le rythme de vie et les conditions de travail
    - Organisation des projets
    - Les outils utilisés en entreprise (OS, git, CI/CD, Confluence, Okta)
    - L'infrastructure (Micro-services, Docker, k8s)
- La présentation du produit
- Les missions techniques pour Bedrock
    - Buildstructor: Mon tout premier projet => Code
    - Min write is too low => Infra
    - Add a new platform => Infra + code
    - Migrate route to Rust => code + pair-programming + graphql
    - Renovate => code
    - Auto generation of the documentation => code + architecture
    - Implement a RFC => code
    - Functional alerting => infrastructure
- Conclusion de mon expérience en entreprise
- Présentation de My Digital Project
    - Les objectifs de réalisation
    - Le calendrier de développement
    - Les inévitables problèmes de réalisation
- Les étapes notables de la réalisation de Remae
    - Conceptions techniques
        - Expression du besoin
        - Architecture Générale
        - Architecture de la BDD
        - Architecture de la CI
    - Réalisation de l'API utilisateurs
    - Création du Front-end de l'application
    - Hébergement de l'application
- Conclusion de mon expérience avec My Digital Project
- Conclusion du dossier

## Présentation de Bedrock Streaming - "Making streaming champions"

Présent dans 10 Pays, avec plus de 400 collaborateurs depuis 15 ans. Bedrock
est une grande entreprise qui fait partie du groupe M6.

La mission de Bedrock streaming est de s'occuper entièrement du service de
streaming pour des clients possédant un catalogue de contenu vidéo et audio.

Par exemple l'entreprise Videoland (Basée aux Pays-Bas) possède un catalogue
important de vidéos, mais ne souhaite pas s'occuper du poids de s'occuper de
l'infrastructure nécessaire à traiter la quantité importante d'utilisateurs
souhaitant accéder à ce contenu. Videoland fait donc appel à Bedrock, qui se
charge de développer le service de streaming, de l'héberger, et même s'occupe
de la publicité sur le site.

Bedrock faisait initialement partie de M6, et s'est séparé en une entité
séparée afin d'atteindre de nouveaux clients, qui sont Videoland et RTL.

Bedrock se distingue par plusieurs facteurs clés qui placent l'entreprise en
avant-garde de l'industrie du streaming. L'infrastructure de Bedrock est
exceptionnellement scalable, capable de s'adapter à une multiplication de son
nombre d'utilisateurs par 1000 en moins de cinq minutes, assurant ainsi une
expérience fluide même en cas de pics de trafic soudains. Cette capacité de
scalabilité rapide est un atout majeur pour les clients souhaitant gérer de
grandes bases d'utilisateurs sans compromettre les performances. De plus,
Bedrock offre une disponibilité sur un très large panel de devices, allant des
smartphones aux smart TVs, en passant par les tablettes et les consoles de jeu.
Cette compatibilité étendue permet aux utilisateurs de profiter de contenus où
qu'ils soient, sur l'appareil de leur choix. Enfin, les stratégies de
monétisation avancées de Bedrock permettent à ses clients de maximiser leurs
revenus grâce à une intégration fluide de la publicité, des abonnements et des
transactions à la demande. Ces éléments font de Bedrock un partenaire de choix
pour toute entreprise souhaitant offrir un service de streaming de haute
qualité à ses utilisateurs.


### La structure de Bedrock

Bedrock est structuré de manière à optimiser la collaboration et l'efficacité.

L'entreprise est divisée en plusieurs départements principaux :

- **Business & Product** : Ce sont les équipes chargées du marketing et de la
  vente du produit.
- **Support Functions** : Ce sont ici toutes les équipes dites de soutient.
  Elles incluent notamment les équipes des Ressources humaines, les finances et
  les équipes légales.
- **Growth, Innovation & Solutions** : Ce sont des petites équipes chargées de
  l'innovation de Bedrock.
- **Delivery** : Ce sont ici les équipes chargées de l'infrastructure de
  Bedrock et de sa maintenance. On y trouve notamment tous les DevOps.
- **Tech** : Enfin, le département Tech se charge du développement de la
  solution de streaming. C'est dans ce département que je travaille, et je vais
  maintenant détailler le fonctionnement de ses équipes.

Il y a de nombreuses équipes dans le département Tech, qui sont séparées par
responsabilité.

Il y a par exemple une équipe différente pour chaque type de plateforme (TV,
Web, Portable), et même des équipes spécifiques aux player de ces plateformes!

Je travaille au sein de l'équipe "Split", qui s'occupe du backend utilisateurs
de toutes nos plateformes.

### Le rythme de vie et les conditions de travail

Le rythme de vie à Bedrock est structuré autour d'horaires traditionnels, de 9h
à 17h, offrant ainsi une stabilité appréciée par les collaborateurs. Cette
structuration des horaires permet à chacun de planifier sa journée de manière
efficace tout en maintenant un bon équilibre entre vie professionnelle et vie
personnelle.

Bedrock facilite également le télétravail avec des règles simples et claires.
Les employés peuvent facilement travailler à distance, assurant ainsi une
flexibilité qui répond aux besoins individuels tout en maintenant la
productivité et la collaboration. Le nombre de jours de télétravail accordés
est de 2,5 jours par semaine, cumulables et utilisables n'importe quand

En plus de ces avantages, Bedrock organise des événements tous les derniers
vendredis de chaque mois, renforçant ainsi le sentiment de communauté et
l'engagement des employés :

Un vendredi sur deux, l'entreprise organise un LFT (Last Friday Talk), une
journée où des conférences sont données par les employés sur des sujets de leur
choix. Ces conférences permettent aux collaborateurs de partager leurs passions
et leurs connaissances, favorisant ainsi l'apprentissage et l'inspiration au
sein des équipes.

L'autre vendredi, Bedrock consacre une journée à l'expérimentation. Cette
journée d'expérimentation est dédiée à l'exploration de nouveaux concepts et
technologies liés au travail à Bedrock. C'est au cours de l'une de ces journées
qu'a été testé l'utilisation de Rust et Go (deux langages prometteurs pour les
besoins de Bedrock), démontrant l'engagement de l'entreprise à innover et à
rester à la pointe des technologies. Ces journées permettent aux employés de
sortir des sentiers battus et d'apporter des idées nouvelles et fraîches à
leurs projets.

### Organisation des projets à Bedrock

Les projets chez Bedrock sont organisés selon une méthodologie agile, avec des
cycles de développement en sprints.

- **Sprints** : Chaque projet est divisé en sprints de deux semaines,
  permettant une évaluation et un ajustement réguliers des objectifs et des
  résultats.
- **Rôles de l'Équipe** :
    - **Chef d'équipe** : Facilite les réunions, aide à surmonter les obstacles
      et veille à ce que l'équipe respecte les pratiques agiles. Notre chef
      d'équipe est Yves Clauss, et c'est également mon maître d'alternance.
    - **Product Owner** : Définit les priorités et s'assure que les besoins du
      client sont bien compris et respectés. Il est utile de noter que nous
      n'avons de Product Owner que depuis que quelques semaines, les User
      Stories étaient auparavant gérées par leur créateur.
    - **Développeurs** : Conçoivent, codent et testent les fonctionnalités du
      projet.

### Les outils utilisés en entreprise

Bedrock utilise une gamme d'outils modernes pour optimiser la collaboration et
l'efficacité :

- **OS** : Les systèmes d'exploitation utilisés sont Linux et macOS pour les
  postes de travail. Les développeurs et développeuses sont libres de choisir
  l'option qu'ils ou elles préfèrent. Il est utile de noter que les
  développeurs et développeuses ont l'accès root sur leur ordinateurs, et que
  le choix des outils leur est laissé.
- **Git** : Git est utilisé pour le contrôle de version, avec GitLab comme
  plateforme de gestion de dépôt.
- **CI/CD** : L'intégration continue et le déploiement continu sont gérés via
  Github Actions.
- **Confluence** : Utilisé pour la documentation, les wikis d'équipe et la
  gestion des connaissances.
- **Okta** : Fournit des solutions de gestion des identités et des accès pour
  sécuriser les connexions aux applications et services.

### L'infrastructure

L'infrastructure de Bedrock est conçue pour être robuste, scalable et
résiliente.

- **Micro-services** : L'architecture est basée sur des micro-services,
  permettant une modularité et une scalabilité accrues. Un autre intérêt tout
  particulièrement valable est que cette approche en micro-services nous permet
  de transitionner progressivement de notre ancien langage de prédilection (le
  PHP), vers de nouveaux langages modernes (Rust et Go), sans avoir à réécrire
  toute notre infrastructure en une seule fois.
- **Docker** : Utilisé pour la containerisation des applications, assurant une
  portabilité et une cohérence entre les environnements de développement, de
  test et de production.
- **Kubernetes (k8s)** : Orchestration des conteneurs pour automatiser le
  déploiement, la gestion, la mise à l'échelle et le fonctionnement des
  applications conteneurisées.
- **Helm** : Helm est utilisé pour la gestion des charts Kubernetes,
  simplifiant ainsi le déploiement et la gestion des applications sur
  Kubernetes. Helm nous permet de définir, installer et mettre à jour
  facilement nos applications Kubernetes, en rendant la gestion des
  applications plus simple et plus cohérente.
- **Terraform** : Terraform est employé pour l'infrastructure as code (IaC),
  permettant de provisionner et de gérer notre infrastructure via des fichiers
  de configuration déclaratifs. Avec Terraform, nous pouvons automatiser la
  création, la mise à jour et la suppression des ressources cloud, assurant
  ainsi une gestion cohérente et reproductible de notre infrastructure.

## Présentation du produit de Bedrock

Bedrock propose une plateforme de streaming vidéo et audio de pointe, adaptée
aux besoins des entreprises possédant des catalogues de contenu multimédia. La
plateforme offre :

- **Interface Utilisateur** : Intuitive et personnalisable, optimisée pour une
  expérience utilisateur fluide sur de nombreux types de devices (smartphones,
  tablettes, smart TVs).
- **Gestion de Contenu** : Outils avancés pour l'organisation, la gestion et la
  distribution de contenu multimédia, y compris des algorithmes avancés de
  recommandation de contenu.
- **Monétisation** : Intégration de diverses stratégies de monétisation, y
  compris la publicité, les abonnements et les transactions à la demande.
- **Analyse et Reporting** : Tableau de bord analytique pour suivre les
  performances, l'engagement des utilisateurs et optimiser les stratégies de
  contenu et de marketing.

## Les missions techniques pour Bedrock

Vous trouverez listé ci-dessous une liste de missions que j'ai effectué dans le
cadre de mon alternance à BedRock.

Tous les projets ont été réalisés dans le cadre de sprints agiles, et étaient
encadrés par l'équipe.

Cette liste n'est pas exaustive, je me suis contenté de garder uniquement les
projets les plus intéressants.

### Buildstructor: Mon tout premier projet

L'objectif de ce projet était d'ajouter la macro buildstructor à de nombreux
constructeurs afin de les transformer en modèles de builder. Buildstructor est
une bibliothèque Rust utilisée pour convertir toute méthode ::new() en builder,
ce qui peut être très utile car les builders sont fastidieux à écrire en Rust.

Quelques builders avaient déjà été créés manuellement, j'ai donc dû les
convertir également, supprimant ainsi une bonne quantité de code. Cette
simplification non seulement rend le code plus propre et plus facile à
maintenir, mais elle améliore également la compréhension des design patterns en
Rust. Travailler sur ce projet m'a permis de renforcer mes compétences en Rust
et en design patterns, des compétences essentielles pour devenir un développeur
plus efficace et polyvalent.

### Min write is too low

L'objectif de ce projet était d'augmenter la valeur minimale d'un paramètre
dans AWS pour éviter les erreurs lors des pics d'utilisateurs. J'ai dû modifier
les fichiers de configuration Terraform pour ajuster ces valeurs, ce qui m'a
permis de mieux comprendre le fonctionnement de certains services AWS, ainsi
que le fonctionnement général de l'infrastructure de Bedrock.

L'histoire amusante est que lorsque j'ai appliqué les modifications, je n'avais
pas suffisamment vérifié ce qui allait être modifié. Cela a entraîné la
réinitialisation de nombreux paramètres de table à leurs valeurs par défaut,
provoquant une interruption de service pour nos clients pendant quelques
minutes. Ce n'était pas un accident grave, mais c'était mon premier, et
heureusement, j'étais bien supervisé.

Cette expérience m'a appris l'importance de la vérification minutieuse avant
d'appliquer des changements en production. Elle m'a également donné une
meilleure compréhension de Terraform et AWS, essentiels pour la gestion de
l'infrastructure cloud et la minimisation des erreurs.

### Add a new platform

Notre application repose sur le concept de plateformes, qui sont différents
types de clients pouvant consommer notre produit. L'objectif était d'ajouter
une nouvelle plateforme, à la fois du côté Rust et du côté PHP.

C'était très intéressant de travailler sur les deux aspects. Cela m'a permis
d'intégrer une nouvelle fonctionnalité de manière complète et cohérente dans
notre système, en utilisant deux langages de programmation différents.
Travailler sur ce projet m'a aidé à mieux comprendre les interactions entre
différents langages et comment les intégrer efficacement dans une application
complexe.

### Migrate route to Rust

L'une de nos routes d'authentification était trop lente et commençait à poser
des problèmes, nous avons donc choisi de la réécrire en Rust.

Ce fut une excellente expérience, recréant la fonctionnalité en Rust, modifiant
le routeur pour utiliser la route mise à jour et supprimant le code PHP
obsolète. Travailler en pair-programming m'a permis de bénéficier des
compétences et des perspectives de mon partenaire, rendant le processus
d'apprentissage plus riche et plus dynamique.

Ce projet m'a non seulement permis de comprendre en profondeur Rust et ses
avantages en termes de performance, mais il m'a aussi donné l'occasion de
travailler avec GraphQL et d'améliorer la fluidité de notre application. Cette
expérience m'a aidé à développer des compétences précieuses en optimisation et
en migration de code, essentielles pour résoudre des problèmes de performance
et améliorer l'efficacité des applications.

### Renovate => code

Notre équipe met régulièrement à jour les dépendances de notre logiciel, ce que
nous appelons le "renovate day". Ce renovate day en particulier a été très
intéressant car l'une de nos dépendances avait reçu une mise à jour majeure et
modifié son API.

J'ai donc dû mettre à jour une grande partie de notre code et modifier
certaines logiques pour que le programme puisse être compilé. Ce projet m'a
permis de me familiariser avec la gestion des dépendances et l'importance de
maintenir le code à jour avec les nouvelles versions des bibliothèques.

Mettre à jour les dépendances et adapter le code en conséquence est une
compétence essentielle pour tout développeur, car cela garantit que le logiciel
reste sécurisé, performant et compatible avec les dernières technologies.

### Auto generation of the documentation => code + architecture

J'ai utilisé une bibliothèque pour générer automatiquement la documentation
pour l'un de nos projets, réalisée avec Swagger. Ce fut un travail conséquent
car j'ai dû approfondir la compréhension de l'architecture du projet.

Travailler sur ce projet m'a permis de découvrir comment intégrer Swagger pour
automatiser la documentation de notre API. Swagger offre un moyen efficace de
décrire et de documenter les endpoints, les modèles de données et les
opérations de notre application, facilitant ainsi la collaboration entre les
développeurs et les équipes opérationnelles. Comprendre en profondeur
l'architecture d'un projet est crucial pour créer une documentation précise et
utile. Cette expérience m'a non seulement aidé à améliorer mes compétences en
Rust, mais elle m'a aussi montré l'importance d'une documentation claire et
structurée pour assurer la qualité et la maintenance efficace des logiciels.

### Implement a RFC => code

Notre entreprise a rédigé une RFC (Request For Comments) et j'ai été chargé de
la transformer en une fonctionnalité réelle dans notre logiciel.

Ce projet a été une bonne opportunité pour appliquer les principes de
gouvernance et de collaboration définis par la RFC. Implémenter cette
fonctionnalité m'a permis de comprendre comment intégrer les décisions
stratégiques et techniques prises au niveau de l'entreprise dans le code réel.
Travailler sur ce projet m'a également aidé à renforcer mes compétences en
Rust, en particulier en ce qui concerne l'intégration de nouvelles
fonctionnalités tout en maintenant la cohérence et la qualité du code existant.

## Conclusion de mon expérience en entreprise

Mon expérience chez Bedrock a été extrêmement enrichissante. J'ai pu travailler
sur des projets variés, développer de nouvelles compétences techniques et
collaborer avec des professionnels talentueux. L'environnement dynamique et les
conditions de travail flexibles ont favorisé mon épanouissement professionnel
et personnel.

Ce fut également une opportunité de découvrir ce qu'est le métier de
développeur Back-end et de travailler avec une infrastructure énorme.

Enfin, plus personnellement, ce fut une opportunité inespérée de travailler
professionellement avec le langage Rust.

## Présentation de My Digital Project

My Digital Project représente un projet fil rouge crucial pour mon école, axé sur la création de Remae, une plateforme de vente de vêtements en ligne écoresponsable, comparable à Vinted mais avec un fort accent sur la durabilité. Notre objectif est de fournir une alternative élégante et respectueuse de l'environnement à la mode rapide, en intégrant des pratiques de production éthiques et en encourageant une consommation consciente.

### Les objectifs de réalisation

Les objectifs principaux de My Digital Project incluent la conception et le lancement réussis de Remae, en offrant une expérience d'achat en ligne attrayante et écologiquement responsable. Nous visons à créer une plateforme technologiquement avancée qui répond aux besoins des utilisateurs tout en reflétant nos valeurs éthiques.

### Le calendrier de développement

Le calendrier de développement de Remae est soigneusement planifié pour respecter les jalons académiques et les exigences de qualité. Chaque phase du projet est structurée pour assurer une progression efficace et cohérente tout en respectant les délais impartis.

### Les inévitables problèmes de réalisation

Nous sommes conscients que des défis imprévus peuvent survenir tout au long du projet. Cela peut inclure des ajustements nécessaires dans les spécifications techniques, des changements de priorités ou des obstacles techniques. Notre approche méthodique nous permet de gérer ces défis de manière proactive et de maintenir le projet sur la bonne voie.

## Les étapes notables de la réalisation de Remae

### Conceptions techniques

#### Expression du besoin

Le besoin croissant d'une plateforme de mode en ligne respectueuse de l'environnement a motivé le développement de Remae.

#### Architecture Générale

L'architecture de Remae est conçue pour offrir une expérience utilisateur intuitive et sécurisée, tout en intégrant des fonctionnalités avancées de personnalisation basées sur les préférences écologiques des utilisateurs.

#### Architecture de la BDD

La structure de base de données de Remae est optimisée pour gérer efficacement un grand volume de données produits tout en garantissant des performances optimales et une intégrité des données rigoureuse.

#### Architecture de la CI

Nous avons implémenté une intégration continue (CI) robuste pour automatiser les tests et les déploiements, assurant ainsi une qualité logicielle constante et une livraison efficace des nouvelles fonctionnalités.

### Réalisation de l'API utilisateurs

Nous avons développé une API utilisateur sécurisée et performante qui facilite la navigation, l'achat et la vente de vêtements tout en soutenant nos engagements en matière de durabilité.

### Création du Front-end de l'application

Le front-end de Remae offre une interface esthétique et conviviale, mettant en valeur nos produits tout en offrant une expérience de navigation fluide et engageante.

### Hébergement de l'application

Nous avons choisi un hébergement cloud fiable et évolutif pour assurer la disponibilité continue de Remae, optimiser les performances et garantir la sécurité des données utilisateur.

## Conclusion de mon expérience avec My Digital Project

Participer à My Digital Project et à la création de Remae a été une expérience formatrice qui m'a permis de développer mes compétences en développement logiciel, en gestion de projet et en conception d'interfaces utilisateur. Je suis fier de contribuer à un projet qui combine technologie et responsabilité environnementale, ouvrant ainsi la voie à une consommation plus consciente dans l'industrie de la mode.
