# Create Virtual Environment
venv:
	python3 -m venv venv
	source venv/bin/activate
	pip install --upgrade pip
	pip install -r requirements.txt
create_django_project:
	source venv/bin/activate
	cookiecutter cookiecutter-django-template/