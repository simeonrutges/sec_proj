# Robot Framework Project Template WIP

Herbruikbare basis voor Robot Framework, met ondersteuning voor **Windows (venv)** en **Linux/Mac/Pi (Docker)**.  

---

## Quickstart

- **Windows/VM**  
  ```powershell
  .\run-dev.bat

👉 Draait tests in je lokale venv.

Linux/Mac/Pi (dev)

./run-dev.sh


👉 Draait tests in Docker met .env in projectroot.

Linux/Mac/Pi (prod)

./run-prod.sh


👉 Draait tests in Docker met secrets uit ~/.sec_proj.env.

## Projectstructuur
SEC_PROJ/
├── tests/                  # Robot test suites
│   └── hello.robot
├── resources/              # (optioneel) Resource files
├── libraries/              # (optioneel) Custom Python libraries
├── Dockerfile              # Docker image definitie
├── docker-compose.yml      # Basis Compose config
├── docker-compose.override.yml   # Dev (met .env)
├── docker-compose.prod.yml       # Prod (met ~/.sec_proj.env op de Pi)
├── run-dev.bat             # Windows: start tests in venv
├── run-dev.sh              # Linux/Mac/Pi: start tests in Docker (dev)
├── run-prod.sh             # Pi/Linux/Mac: start tests in Docker (prod)
├── requirements.txt        # Python dependencies (of pyproject.toml als je Poetry gebruikt)
├── .env                    # Lokaal ontwikkel-ENV (gitignored)
├── .gitignore
└── README.md

## Windows (via venv)

Initialiseer venv (eenmalig):

python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt


Zet environment variables

Permanent via System Properties → Advanced → Environment Variables

of tijdelijk in .env (wordt ingeladen door override).

Run tests:
Dubbelklik run-dev.bat of run:

.\run-dev.bat


👉 Resultaten komen in .\results\.

## Linux/Mac/Pi (via Docker)

Ontwikkelmodus (met .env in projectroot)

./run-dev.sh


Productiemodus (met ~/.sec_proj.env)

./run-prod.sh


👉 Resultaten komen in ./results/.

## Secrets & Environment Variables

Dev (Windows/Mac/Linux): gebruik .env in de projectroot (gitignored).

API_URL=https://api.dev.local
SECRET_KEY=dev-secret


Prod (Pi): gebruik ~/.sec_proj.env buiten de repo.

API_URL=https://api.prod.example
SECRET_KEY=supersecret

##  Nieuwe dependencies toevoegen

Voeg de dependency toe in requirements.txt
of (bij gebruik van Poetry) in pyproject.toml.

Commit & push naar GitHub.

Op de Pi rebuild de image:

cd ~/sec_proj
git pull
docker compose build


