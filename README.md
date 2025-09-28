<!-- Language Navigation -->
<div align="center">

[🇪🇸 **Español**](#curso-de-machine-learning) | [🇺🇸 **English**](#machine-learning-course)

</div>

---

# Curso de Machine Learning

Este repositorio contiene un curso completo de Machine Learning con enfoque práctico, organizado en 10 módulos semanales con ejercicios, proyectos y documentación detallada.

## 📚 Contenido por semana

| Semana   | Contenido                                                          |
| -------- | -------------------------------------------------------------------|
| Semana 1 | [Fundamentos de Machine Learning](./week1/)                        |
| Semana 2 | [Algoritmos Supervisados - Regresión](./week2/)                    |
| Semana 3 | [Algoritmos Supervisados - Clasificación](./week3/)                |
| Semana 4 | [Árboles y Ensemble Methods](./week4/)                             |
| Semana 5 | [Algoritmos No Supervisados](./week5/)                             |
| Semana 6 | [Deep Learning - Fundamentos](./week6/)                            |
| Semana 7 | [Deep Learning - CNN](./week7/)                                    |
| Semana 8 | [Deep Learning - RNN/LSTM](./week8/)                               |
| Semana 9 | [Evaluación y Optimización](./week9/)                              |
| Semana 10| [Proyecto Final y Deployment](./week10/)                           |

*Cada carpeta `weekX/` incluye notebooks, datos y dependencias específicas del módulo.*

## ✅ Tareas por semana

| Semana   | Tareas                                                                |
| -------- | ----------------------------------------------------------------------|
| Semana 1 | [Tarea - Fundamentos de ML](./homework1/)                             |
| Semana 2 | [Tarea - Regresión](./homework2/)                                     |
| Semana 3 | [Tarea - Clasificación](./homework3/)                                 |
| Semana 4 | [Tarea - Árboles y Ensemble](./homework4/)                            |
| Semana 5 | [Tarea - No Supervisados](./homework5/)                               |
| Semana 6 | [Tarea - Deep Learning - Fundamentos](./homework6/)                   |
| Semana 7 | [Tarea - CNN](./homework7/)                                           |
| Semana 8 | [Tarea - RNN/LSTM](./homework8/)                                      |
| Semana 9 | [Tarea - Evaluación y Optimización](./homework9/)                     |
| Semana 10| [Tarea - Proyecto Final](./homework10/)                               |

*En las carpetas `homeworkX/` encontrarás desafíos prácticos para reforzar lo aprendido en cada semana.*

## 🛠️ Workshops y Proyectos

| Workshop | Proyecto                                                              |
| -------- | ----------------------------------------------------------------------|
| Workshop 1 | [Proyecto de Clasificación](./workshop1/)                             |
| Workshop 2 | [Proyecto de Regresión](./workshop2/)                                 |
| Workshop 3 | [Proyecto de Deep Learning](./workshop3/)                             |

*Los workshops incluyen proyectos prácticos completos con análisis de resultados.*

## 🛠️ Cómo usar este repositorio

### 1. Configuración del entorno

Este proyecto utiliza `uv` como gestor de dependencias. Para más detalles, consulta la guía [working-with-uv.md](./docs/working-with-uv.md).

```bash
# Instalar uv (si no lo tienes)
curl -LsSf https://astral.sh/uv/install.sh | sh

# Clonar el repositorio
git clone <url-del-repositorio>
cd ml-zoomcamp-knowledge-base
```

### 2. Trabajar con un módulo específico

Cada módulo tiene su propio entorno virtual y dependencias:

```bash
# Navegar al módulo
cd week1

# Crear y activar entorno virtual
uv venv && uv sync

# Activar entorno
source .venv/bin/activate

# Iniciar Jupyter
jupyter notebook
```

### 3. Estructura de cada módulo

- `notebook/` - Jupyter notebooks con el contenido del módulo
- `img/` - Imágenes y diagramas
- `data/` - Datasets específicos del módulo
- `pyproject.toml` - Dependencias del módulo
- `uv.lock` - Versiones bloqueadas para reproducibilidad

### 4. Completar tareas

```bash
# Navegar a la tarea
cd homework1

# Configurar entorno
uv venv && uv sync

# Activar entorno
source .venv/bin/activate

# Iniciar Jupyter
jupyter notebook
```

## 📁 Estructura del repositorio

```
ml-zoomcamp-knowledge-base/
├── week1-10/       # Módulos del curso (10 semanas)
├── homework1-10/   # Tareas por semana
├── workshop1-3/    # Proyectos prácticos
├── docs/           # Documentación adicional
├── data/           # Datasets globales
├── src/            # Código fuente reutilizable
├── tests/          # Pruebas unitarias
└── .github/        # GitHub Actions
```

## 🔧 Herramientas y tecnologías

- **Python 3.13+** - Lenguaje principal
- **uv** - Gestor de dependencias
- **Jupyter Notebooks** - Entorno de desarrollo
- **scikit-learn** - Algoritmos de ML
- **pandas** - Manipulación de datos
- **matplotlib/seaborn** - Visualización
- **tensorflow/pytorch** - Deep Learning
- **GitHub Actions** - CI/CD

## 📖 Documentación adicional

- [Configuración del entorno](./docs/setup-environment.md)
- [Guía de uso de uv](./docs/working-with-uv.md)
- [Material teórico](./docs/teoria/)
- [Referencias y bibliografía](./docs/referencias/)

## 🤝 Contribuciones

Si quieres mejorar o agregar contenido, abre un issue o envía un pull request.

## 📝 Licencia

Este repositorio está licenciado bajo la [Licencia MIT](LICENSE).

---

> 📌 **Nota:** Este curso está diseñado para ser práctico y hands-on. Cada módulo incluye teoría, ejemplos de código y ejercicios para reforzar el aprendizaje.

---

# Machine Learning Course

This repository contains a complete Machine Learning course with a practical approach, organized in 10 weekly modules with exercises, projects, and detailed documentation.

## 📚 Content by week

| Week     | Content                                                      |
| -------- | ------------------------------------------------------------|
| Week 1   | [Machine Learning Fundamentals](./week1/)                   |
| Week 2   | [Supervised Algorithms - Regression](./week2/)              |
| Week 3   | [Supervised Algorithms - Classification](./week3/)          |
| Week 4   | [Trees and Ensemble Methods](./week4/)                      |
| Week 5   | [Unsupervised Algorithms](./week5/)                         |
| Week 6   | [Deep Learning - Fundamentals](./week6/)                    |
| Week 7   | [Deep Learning - CNN](./week7/)                             |
| Week 8   | [Deep Learning - RNN/LSTM](./week8/)                        |
| Week 9   | [Evaluation and Optimization](./week9/)                     |
| Week 10  | [Final Project and Deployment](./week10/)                   |

*Each `weekX/` folder includes notebooks, data, and specific module dependencies.*

## ✅ Assignments by week

| Week     | Assignments                                                  |
| -------- | ------------------------------------------------------------|
| Week 1   | [Assignment - ML Fundamentals](./homework1/)                |
| Week 2   | [Assignment - Regression](./homework2/)                     |
| Week 3   | [Assignment - Classification](./homework3/)                 |
| Week 4   | [Assignment - Trees and Ensemble](./homework4/)             |
| Week 5   | [Assignment - Unsupervised](./homework5/)                   |
| Week 6   | [Assignment - Deep Learning - Fundamentals](./homework6/)   |
| Week 7   | [Assignment - CNN](./homework7/)                            |
| Week 8   | [Assignment - RNN/LSTM](./homework8/)                       |
| Week 9   | [Assignment - Evaluation and Optimization](./homework9/)    |
| Week 10  | [Assignment - Final Project](./homework10/)                 |

*In the `homeworkX/` folders you'll find practical challenges to reinforce what you learned each week.*

## 🛠️ Workshops and Projects

| Workshop    | Project                                                      |
| ----------- | ------------------------------------------------------------|
| Workshop 1  | [Classification Project](./workshop1/)                      |
| Workshop 2  | [Regression Project](./workshop2/)                           |
| Workshop 3  | [Deep Learning Project](./workshop3/)                       |

*The workshops include complete practical projects with results analysis.*

## 🛠️ How to use this repository

### 1. Environment setup

This project uses `uv` as the dependency manager. For more details, check the [working-with-uv.md](./docs/working-with-uv.md) guide.

```bash
# Install uv (if you don't have it)
curl -LsSf https://astral.sh/uv/install.sh | sh

# Clone the repository
git clone <repository-url>
cd ml-zoomcamp-knowledge-base
```

### 2. Working with a specific module

Each module has its own virtual environment and dependencies:

```bash
# Navigate to the module
cd week1

# Create and activate virtual environment
uv venv && uv sync

# Activate environment
source .venv/bin/activate

# Start Jupyter
jupyter notebook
```

### 3. Module structure

- `notebook/` - Jupyter notebooks with module content
- `img/` - Images and diagrams
- `data/` - Module-specific datasets
- `pyproject.toml` - Module dependencies
- `uv.lock` - Locked versions for reproducibility

### 4. Complete assignments

```bash
# Navigate to assignment
cd homework1

# Set up environment
uv venv && uv sync

# Activate environment
source .venv/bin/activate

# Start Jupyter
jupyter notebook
```

## 📁 Repository structure

```
ml-zoomcamp-knowledge-base/
├── week1-10/       # Course modules (10 weeks)
├── homework1-10/   # Weekly assignments
├── workshop1-3/    # Practical projects
├── docs/           # Additional documentation
├── data/           # Global datasets
├── src/            # Reusable source code
├── tests/          # Unit tests
└── .github/        # GitHub Actions
```

## 🔧 Tools and technologies

- **Python 3.13+** - Main language
- **uv** - Dependency manager
- **Jupyter Notebooks** - Development environment
- **scikit-learn** - ML algorithms
- **pandas** - Data manipulation
- **matplotlib/seaborn** - Visualization
- **tensorflow/pytorch** - Deep Learning
- **GitHub Actions** - CI/CD

## 📖 Additional documentation

- [Environment setup](./docs/setup-environment.md)
- [uv usage guide](./docs/working-with-uv.md)
- [Theoretical material](./docs/teoria/)
- [References and bibliography](./docs/referencias/)

## 🤝 Contributing

If you want to improve or add content, open an issue or send a pull request.

## 📝 License

This repository is licensed under the [MIT License](LICENSE).

---

> 📌 **Note:** This course is designed to be practical and hands-on. Each module includes theory, code examples, and exercises to reinforce learning.
