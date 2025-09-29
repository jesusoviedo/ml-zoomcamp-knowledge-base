# Configuración del Entorno de Desarrollo

Esta guía te ayudará a configurar tu entorno de desarrollo para trabajar con el curso de Machine Learning.

## Requisitos del Sistema

- **Python 3.13+** - Versión mínima requerida
- **Git** - Para control de versiones
- **uv** - Gestor de dependencias (recomendado)
- **Jupyter Notebook** - Entorno de desarrollo interactivo

## Instalación de Python

### Ubuntu/Debian
```bash
sudo apt update
sudo apt install python3.13 python3.13-venv python3.13-dev
```

### macOS (usando Homebrew)
```bash
brew install python@3.13
```

### Windows
Descarga Python 3.13+ desde [python.org](https://www.python.org/downloads/)

## Instalación de uv

### Linux/macOS
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### Windows
```bash
powershell -c "irm https://astral.sh/uv/install.ps1 | iex"
```

### Verificar instalación
```bash
uv --version
```

## Configuración del Proyecto

### 1. Clonar el repositorio
```bash
git clone <url-del-repositorio>
cd ml-zoomcamp-knowledge-base
```

### 2. Configurar un módulo específico
```bash
# Navegar al módulo
cd week1

# Crear entorno virtual
uv venv

# Instalar dependencias
uv sync

# Activar entorno
source .venv/bin/activate  # Linux/macOS
# o
.venv\Scripts\activate     # Windows
```

### 3. Instalar Jupyter Notebook
```bash
uv add jupyter notebook
```

### 4. Iniciar Jupyter
```bash
jupyter notebook
```

## Estructura de Entornos

Cada módulo tiene su propio entorno virtual para evitar conflictos de dependencias:

```
week1/
├── .venv/          # Entorno virtual
├── pyproject.toml  # Dependencias
├── uv.lock        # Versiones bloqueadas
└── notebook/      # Jupyter notebooks
```

## Script de Lanzamiento Automático

Para facilitar el trabajo con los diferentes módulos del curso, hemos incluido un script que automatiza el proceso de navegación y lanzamiento de Jupyter Lab.

### Características del Script

El script `jupyter_launcher.sh` incluye:

- **Menú interactivo organizado** por categorías (Semanas, Homework, Workshops)
- **Navegación automática** a la carpeta seleccionada
- **Lanzamiento automático** de Jupyter Lab con `uv run`
- **Limpieza de entornos virtuales** no utilizados
- **Interfaz colorizada** y fácil de usar

### Uso del Script

```bash
# Hacer el script ejecutable (solo la primera vez)
chmod +x jupyter_launcher.sh

# Ejecutar el script
./jupyter_launcher.sh
```

### Estructura del Menú

El script presenta un menú principal con las siguientes opciones:

1. ** Semanas (week1-week10)** - Acceso a los módulos del curso
2. **📝 Homework (homework1-homework10)** - Acceso a las tareas
3. ** Workshops (workshop1-workshop3)** - Acceso a los proyectos
4. **🧹 Limpiar archivos .venv** - Limpieza de entornos virtuales
5. **Salir** - Salir del script

### Submenús

Al seleccionar una categoría, se muestra un submenú con las opciones específicas:

- **Semanas**: week1, week2, ..., week10
- **Homework**: homework1, homework2, ..., homework10  
- **Workshops**: workshop1, workshop2, workshop3

### Funcionalidad de Limpieza

La opción "🧹 Limpiar archivos .venv" permite:

- **Buscar automáticamente** todas las carpetas `.venv` en el proyecto
- **Mostrar una lista** de lo que se va a eliminar
- **Solicitar confirmación** antes de proceder
- **Eliminar de forma segura** con mensajes de estado

### Ejemplo de Uso

```bash
$ ./jupyter_launcher.sh

========================================
   ML ZOOMCAMP - JUPYTER LAB LAUNCHER  
========================================

Selecciona una opción:

1) 📚 Semanas (week1-week10)
2) 📝 Homework (homework1-homework10)
3) 🔧 Workshops (workshop1-workshop3)
4) 🧹 Limpiar archivos .venv
5) Salir

Ingresa tu opción (1-5): 1

========================================
        SELECCIONAR SEMANA
========================================

Selecciona una semana:

1) week1
2) week2
3) week3
...
10) week10
11) Volver al menú principal

Ingresa tu opción (1-11): 1

✅ Navegando a week1...
✅ Lanzando Jupyter Lab...
```

## Comandos Útiles

### Activar/Desactivar entorno
```bash
# Activar
source .venv/bin/activate

# Desactivar
deactivate
```

### Instalar dependencias adicionales
```bash
uv add pandas matplotlib scikit-learn
```

### Actualizar dependencias
```bash
uv upgrade
```

### Ejecutar scripts
```bash
uv run python script.py
```

## Solución de Problemas

### Error de permisos
```bash
sudo chown -R $USER:$USER /home/joviedo/github-repos/ml-zoomcamp-knowledge-base
```

### Limpiar caché de uv
```bash
uv cache clean
```

### Recrear entorno virtual
```bash
rm -rf .venv
uv venv --recreate
uv sync
```

## IDE Recomendado

### Visual Studio Code
- Extensiones recomendadas:
  - Python
  - Jupyter
  - Python Docstring Generator
  - GitLens

### PyCharm
- Configuración del intérprete Python
- Soporte nativo para Jupyter Notebooks

## Verificación de la Instalación

Ejecuta este script para verificar que todo esté configurado correctamente:

```python
import sys
print(f"Python version: {sys.version}")

try:
    import pandas as pd
    print("✅ pandas instalado")
except ImportError:
    print("❌ pandas no encontrado")

try:
    import numpy as np
    print("✅ numpy instalado")
except ImportError:
    print("❌ numpy no encontrado")

try:
    import sklearn
    print("✅ scikit-learn instalado")
except ImportError:
    print("❌ scikit-learn no encontrado")
```

## Próximos Pasos

1. Navega a `week1/` para comenzar con los fundamentos
2. Lee el README.md del módulo
3. Abre los notebooks en Jupyter
4. Completa los ejercicios

---

> 📌 **Nota:** Si encuentras algún problema, consulta la sección de solución de problemas o abre un issue en el repositorio.
