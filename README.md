<div align="center">
    <a href="https://www.atc.qld.edu.au/">
        <img src="/static/dist/images/atc-main.png" width="64" height="64" alt="ATC logo">
    </a>
    <h1>
        <a href="https://github.com/NathanPerrier/IA3-Perrier-Fishing-Website-Digital">
            IA3 Fishing Website
        </a>
    </h1>
    <p>
        <strong>Rocket Django</strong> &bull; <strong>TailwindCSS</strong> &bull; <strong>Flowbite</strong> &bull; <strong>OpenAI</strong> &bull; <strong>API (DRF)</strong> &bull; <strong>Celery</strong> &bull; <strong>Redis</strong> &bull; <strong>DataTables</strong> &bull; <strong>Charts</strong> &bull; <strong>Docker</strong> &bull; <strong>CI/CD</strong>
    </p>     
</div>

<br />

<div align="center">
    <img src="./static/dist/images/IA3.gif" alt="IA3 Demo">

</div>

<br />

## About The Project

This website brings an innovative solution to the Ambrose Treacy College fishing club. This website utilizes government APIs to allow members to easily identify what they caught. Furthermore, social features introduce a new way for club members to interact.

<br />

## Manual Build 

> 👉 Download code

```bash
git clone https://github.com/NathanPerrier/IA3-Perrier-Fishing-Website-Digital
cd IA3-Perrier-Fishing-Website-Digital
```

> 👉 Create `.env` from `env.sample`

```env
DEBUG=False

SECRET_KEY=<STRONG_KEY_HERE>

# For Myql or PgSQL Persistence 
# DB_ENGINE=mysql
# DB_HOST=localhost
# DB_NAME=appseed_rocket_django
# DB_USERNAME=root
# DB_PASS=
# DB_PORT=3306

#SMTP configaration
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USE_TLS=True
EMAIL_HOST_USER=<HOST_EMAIL>
EMAIL_HOST_PASSWORD=<HOST_PASSWORD>

GOOGLE_OAUTH2_CLIENT_ID=<CLIENT_ID>
GOOGLE_OAUTH2_CLIENT_SECRET=<CLIENT_SECRET>

GITHUB_OAUTH2_CLIENT_ID=<CLIENT_ID>
GITHUB_OAUTH2_CLIENT_SECRET=<CLIENT_SECRET>

MICROSOFT_OAUTH2_APP_ID=<CLIENT_ID>
MICROSOFT_OAUTH2_CLIENT_SECRET=<CLIENT_SECRET>
MICROSOFT_OAUTH2_TENANT_ID=<TENANT_ID>

#ReCaptcha
RECAPTCHA_SITE_KEY=<PUBLIC_KEY>
RECAPTCHA_V3_SITE_KEY=<PUBLIC_KEY>
RECAPTCHA_SECRET_KEY=<PRIVATE_KEY>
```

> 👉 Unrestrict **current user** scope   

```bash
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force;
```

> 👉 Install **Django** modules via `VENV`  

```bash
virtualenv env
.\venv\Scripts\activate
pip install -r requirements.txt
```

> 👉 Install **Tailwind/Flowbite** (another terminal)

Tested with **Node** `v18.20.0` (use at least this version or above)

```bash
npm install
npm run dev
npx tailwindcss -i ./static/assets/style.css -o ./static/dist/css/output.css --watch # DEVELOPMENT (LIVE reload)
npx tailwindcss -i ./static/assets/style.css -o ./static/dist/css/output.css         # PRODUCTION
```

> 👉 Migrate DB

```bash
python manage.py makemigrations
python manage.py migrate
```

> 👉 Update the database with **wildlife data** (may take 10-15 minutes)

```bash
python manage.py update_wildlife --fish-only --debug
```

> 👉 Run **celery** worker

```bash
celery -A core worker --loglevel=info -E
```

> 👉 Create `Superuser`

```bash
python manage.py createsuperuser # create the admin
```

> 👉 **run** the website

`Normal **runserver** (http)`

```bash
python manage.py runserver       
```



<br />

## Start With Docker

> 👉 Download code

```bash
git clone https://github.com/NathanPerrier/IA3-Perrier-Fishing-Website-Digital
cd IA3-Perrier-Fishing-Website-Digital
```

> 👉 Start with Docker Compose

```bash
docker-compose up --build 
``` 

Visit the app in the browser `localhost:5085`.

<br />

## Use MySql 

By default, the starter uses SQLite for persistence. In order to use MySql, here are the steps: 

- Start the MySql Server
- Create a new DataBase
- Create a new user with full privileges over the database 
- Install the MySql Python Driver (used by Django to connect)
  - `pip install mysqlclient`
- Edit the `.env` with the SQL Driver Information & DB Credentials 

```env

DB_ENGINE=mysql
DB_HOST=localhost
DB_NAME=<DB_NAME_HERE>
DB_USERNAME=<DB_USER_HERE>
DB_PASS=<DB_PASS_HERE>
DB_PORT=3306

```

Once the above settings are done, run the migration & create tables: 

```bash
python manage.py makemigrations
python manage.py migrate
```

<br />

## Production Build

To use the starter in production mode, here are the steps: 

- Set  **DEBUG=False** in `.env`
- Execute `collectstatic` command
  - `python manage.py collectstatic --no-input`

As a model, feel free to take a look at [build.sh](./build.sh), the file executed by the CI/CD flow for Render:   


<br />

## **Deploy on Render**

- Create a Blueprint instance
  - Go to https://dashboard.render.com/blueprints this link.
- Click `New Blueprint Instance` button.
- Connect the `repo` that you want to deploy.
- Fill the `Service Group Name` and click on the `Update Existing Resources` button.
- Edit the Environment and [specify the PYTHON_VERSION](https://render.com/docs/python-version)
  - Version `3.11.5` was used for **[this deployment](https://rocket-django.onrender.com/)**
- After that, your deployment will start automatically.

At this point, the product should be LIVE.

<br />

## Codebase 

```bash
< PROJECT ROOT >
   |
   |-- core/                 # Project Settings 
   |    |-- settings.py 
   |    |-- wsgi.py     
   |    |-- urls.py     
   |
   |-- home/                 # Presentation app 
   |    |-- views.py         # serve the HOMEpage  
   |    |-- urls.py     
   |    |-- models.py
   |
   |-- apps/                 # Utility Apps 
   |    |-- common/          # defines models & helpers
   |    |    |-- models.py   
   |    |    |-- util.py 
   |    |-- users            # Handles Authentication 
   |    |-- api              # DRF managed API
   |    |-- auth_tokens      # Manages User API tokens
   |    |-- club             # Implements club signup
   |    |-- microsoft_auth   # Oauth2.0 manaement for microsoft (PYPI library)
   |    |-- social           # all social aspects of the website (posts, likes, etc.)
   |    |-- tracking         # tracking and suggestions
   |    |-- wildlifeAPI      # retrieves and stores data from QLD wildlifeNet API
   |    |-- tasks            # Celery, async processing
   |
   |-- templates/            # UI templates 
   |-- static/               # Tailwind/Flowbite 
   |    |-- src/             # 
   |         |-- input.css   # CSS Styling
   |
   |-- Dockerfile            # Docker
   |-- docker-compose.yml    # Docker 
   |
   |-- render.yml            # CI/CD for Render
   |-- build.sh              # CI/CD for Render 
   |
   |-- manage.py             # Django Entry-Point
   |-- requirements.txt      # dependencies
   |-- .env                  # ENV File
   |
   |-- *************************************************      
```   

<br />

## License

@MIT
