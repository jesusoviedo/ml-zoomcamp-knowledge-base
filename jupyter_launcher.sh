#!/bin/bash

# Script para lanzar Jupyter Lab en diferentes carpetas del proyecto ML Zoomcamp
# Autor: Script automático generado

# Colores para el output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Función para mostrar el menú principal
show_main_menu() {
    clear
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}   ML ZOOMCAMP - JUPYTER LAB LAUNCHER  ${NC}"
    echo -e "${BLUE}========================================${NC}"
    echo ""
    echo -e "${YELLOW}Selecciona una opción:${NC}"
    echo ""
    
    # Array con las opciones principales
    main_options=(
        "📚 Semanas (week1-week10)"
        "📝 Homework (homework1-homework10)"
        "🔧 Workshops (workshop1-workshop3)"
        "🧹 Limpiar archivos .venv"
        "Salir"
    )
    
    # Mostrar opciones numeradas
    for i in "${!main_options[@]}"; do
        echo -e "${GREEN}$((i+1)).${NC} ${main_options[i]}"
    done
    
    echo ""
}

# Función para mostrar submenú de semanas
show_weeks_menu() {
    clear
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}         SELECCIONAR SEMANA            ${NC}"
    echo -e "${BLUE}========================================${NC}"
    echo ""
    echo -e "${YELLOW}Selecciona la semana donde quieres abrir Jupyter Lab:${NC}"
    echo ""
    
    # Array con las semanas
    week_options=(
        "week1" "week2" "week3" "week4" "week5"
        "week6" "week7" "week8" "week9" "week10"
        "⬅️ Volver al menú principal"
    )
    
    # Mostrar opciones numeradas
    for i in "${!week_options[@]}"; do
        echo -e "${GREEN}$((i+1)).${NC} ${week_options[i]}"
    done
    
    echo ""
}

# Función para mostrar submenú de homework
show_homework_menu() {
    clear
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}       SELECCIONAR HOMEWORK            ${NC}"
    echo -e "${BLUE}========================================${NC}"
    echo ""
    echo -e "${YELLOW}Selecciona el homework donde quieres abrir Jupyter Lab:${NC}"
    echo ""
    
    # Array con los homework
    homework_options=(
        "homework1" "homework2" "homework3" "homework4" "homework5"
        "homework6" "homework7" "homework8" "homework9" "homework10"
        "⬅️ Volver al menú principal"
    )
    
    # Mostrar opciones numeradas
    for i in "${!homework_options[@]}"; do
        echo -e "${GREEN}$((i+1)).${NC} ${homework_options[i]}"
    done
    
    echo ""
}

# Función para mostrar submenú de workshops
show_workshops_menu() {
    clear
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}       SELECCIONAR WORKSHOP            ${NC}"
    echo -e "${BLUE}========================================${NC}"
    echo ""
    echo -e "${YELLOW}Selecciona el workshop donde quieres abrir Jupyter Lab:${NC}"
    echo ""
    
    # Array con los workshops
    workshop_options=(
        "workshop1" "workshop2" "workshop3"
        "⬅️ Volver al menú principal"
    )
    
    # Mostrar opciones numeradas
    for i in "${!workshop_options[@]}"; do
        echo -e "${GREEN}$((i+1)).${NC} ${workshop_options[i]}"
    done
    
    echo ""
}

# Función para verificar si una carpeta existe
check_folder() {
    if [ -d "$1" ]; then
        return 0
    else
        return 1
    fi
}

# Función para verificar si Jupyter está corriendo
check_jupyter_running() {
    if lsof -i :8888 >/dev/null 2>&1; then
        return 0  # Jupyter está corriendo
    else
        return 1  # Jupyter no está corriendo
    fi
}

# Función para lanzar Jupyter Lab
launch_jupyter() {
    local folder=$1
    echo -e "${BLUE}📁 Cambiando a la carpeta: ${YELLOW}$folder${NC}"
    
    # Verificar si Jupyter está corriendo
    echo -e "${BLUE}🔍 Verificando si Jupyter está corriendo...${NC}"
    
    if check_jupyter_running; then
        echo -e "${YELLOW}⚠️  Jupyter ya está corriendo en puerto 8888${NC}"
        
        # Obtener información del proceso
        jupyter_pid=$(lsof -ti :8888)
        echo -e "${YELLOW}📊 PID del proceso: $jupyter_pid${NC}"
        echo ""
        
        echo -e "${YELLOW}¿Qué deseas hacer?${NC}"
        echo -e "${GREEN}1.${NC} Eliminar Jupyter existente y lanzar uno nuevo"
        echo -e "${GREEN}2.${NC} Usar Jupyter existente"
        echo ""
        
        read -p "Selecciona opción (1-2): " option
        
        case "$option" in
            1)
                echo -e "${BLUE}🔄 Eliminando Jupyter existente...${NC}"
                kill $(lsof -ti :8888) 2>/dev/null
                sleep 2
                
                # Verificar si se terminó
                if check_jupyter_running; then
                    echo -e "${RED}⚠️  Forzando terminación...${NC}"
                    kill -9 $(lsof -ti :8888) 2>/dev/null
                    sleep 1
                fi
                
                if ! check_jupyter_running; then
                    echo -e "${GREEN}✅ Jupyter eliminado correctamente${NC}"
                else
                    echo -e "${RED}❌ No se pudo eliminar Jupyter${NC}"
                    echo -e "${YELLOW}Presiona Enter para continuar...${NC}"
                    read -r
                    return 1
                fi
                echo ""
                ;;
            2)
                echo -e "${GREEN}✅ Usando Jupyter existente${NC}"
                echo ""
                echo -e "${YELLOW}📋 URL para acceder a Jupyter Lab:${NC}"
                echo -e "${GREEN}http://localhost:8888/lab${NC}"
                echo ""
                echo -e "${BLUE}💡 Abre esta URL en tu navegador${NC}"
                echo -e "${YELLOW}Presiona Enter para continuar...${NC}"
                read -r
                return 0
                ;;
            *)
                echo -e "${BLUE}🔄 Eliminando Jupyter existente (opción por defecto)...${NC}"
                kill $(lsof -ti :8888) 2>/dev/null
                sleep 2
                echo ""
                ;;
        esac
    else
        echo -e "${GREEN}✅ No hay Jupyter corriendo${NC}"
        echo ""
    fi
    
    # Verificar y cambiar al directorio
    if check_folder "$folder"; then
        cd "$folder" || {
            echo -e "${RED}❌ Error: No se pudo acceder a la carpeta $folder${NC}"
            echo -e "${YELLOW}Presiona Enter para continuar...${NC}"
            read -r
            return 1
        }
        
        echo -e "${GREEN}✅ Directorio actual: ${YELLOW}$(pwd)${NC}"
        echo ""
        
        # Verificar si Jupyter está instalado
        echo -e "${BLUE}🔍 Verificando si Jupyter está instalado...${NC}"
        if uv run python -c "import jupyter" 2>/dev/null; then
            echo -e "${GREEN}✅ Jupyter está instalado${NC}"
        else
            echo -e "${YELLOW}⚠️  Jupyter no está instalado. Instalando...${NC}"
            uv add jupyter
            if [ $? -eq 0 ]; then
                echo -e "${GREEN}✅ Jupyter instalado correctamente${NC}"
            else
                echo -e "${RED}❌ Error al instalar Jupyter${NC}"
                echo -e "${YELLOW}Presiona Enter para continuar...${NC}"
                read -r
                return 1
            fi
        fi
        echo ""
        
        # Lanzar Jupyter Lab
        echo -e "${BLUE}🚀 Lanzando Jupyter Lab...${NC}"
        echo ""
        echo -e "${YELLOW}📋 URL para acceder a Jupyter Lab:${NC}"
        echo -e "${GREEN}http://localhost:8888/lab${NC}"
        echo ""
        echo -e "${BLUE}💡 Esta URL NO requiere token - ábrela directamente en tu navegador${NC}"
        echo ""
        
        # Lanzar Jupyter Lab en background y capturar logs
        echo -e "${BLUE}🔄 Iniciando servidor en segundo plano...${NC}"
        uv run jupyter lab --no-browser --allow-root --ip=0.0.0.0 --port=8888 > /dev/null 2>&1 &
        jupyter_pid=$!
        
        # Esperar un momento para que el servidor se inicie
        sleep 3
        
        # Verificar si el servidor está corriendo
        if ps -p $jupyter_pid > /dev/null 2>&1; then
            echo -e "${GREEN}✅ Servidor Jupyter iniciado correctamente${NC}"
            echo ""
            echo -e "${YELLOW}📱 El servidor está corriendo en segundo plano${NC}"
            echo -e "${BLUE}💡 Puedes cerrar esta ventana y usar Jupyter Lab${NC}"
            echo ""
            echo -e "${YELLOW}Presiona Enter para volver al menú principal...${NC}"
            read -r
        else
            echo -e "${RED}❌ Error al iniciar el servidor Jupyter${NC}"
            echo -e "${YELLOW}Presiona Enter para continuar...${NC}"
            read -r
        fi
        
    else
        echo -e "${RED}❌ Error: La carpeta '$folder' no existe${NC}"
        echo -e "${YELLOW}Presiona Enter para continuar...${NC}"
        read -r
        return 1
    fi
}

# Función para limpiar archivos .venv
cleanup_venv() {
    echo -e "${YELLOW}🔍 Buscando archivos y carpetas .venv...${NC}"
    echo ""
    
    # Buscar carpetas .venv
    venv_folders=$(find . -name ".venv" -type d 2>/dev/null)
    
    if [ -z "$venv_folders" ]; then
        echo -e "${GREEN}✅ No se encontraron carpetas .venv para limpiar${NC}"
        echo -e "${YELLOW}Presiona Enter para continuar...${NC}"
        read -r
        return
    fi
    
    echo -e "${BLUE}📁 Carpetas .venv encontradas:${NC}"
    echo "$venv_folders" | while read -r folder; do
        echo -e "   ${RED}-${NC} $folder"
    done
    echo ""
    
    echo -e "${YELLOW}¿Estás seguro de que quieres eliminar todas estas carpetas? (s/N): ${NC}"
    read -r confirm
    
    if [[ "$confirm" =~ ^[Ss]$ ]]; then
        echo -e "${BLUE}🗑️ Eliminando carpetas .venv...${NC}"
        echo "$venv_folders" | while read -r folder; do
            if [ -d "$folder" ]; then
                echo -e "${YELLOW}Eliminando: $folder${NC}"
                rm -rf "$folder"
                if [ $? -eq 0 ]; then
                    echo -e "${GREEN}✅ Eliminado: $folder${NC}"
                else
                    echo -e "${RED}❌ Error eliminando: $folder${NC}"
                fi
            fi
        done
        echo ""
        echo -e "${GREEN}🎉 Limpieza completada${NC}"
    else
        echo -e "${BLUE}❌ Operación cancelada${NC}"
    fi
    
    echo -e "${YELLOW}Presiona Enter para continuar...${NC}"
    read -r
}

# Función para manejar el menú de semanas
handle_weeks_menu() {
    while true; do
        show_weeks_menu
        
        # Leer la opción del usuario
        echo -n -e "${YELLOW}Ingresa tu opción (1-${#week_options[@]}): ${NC}"
        read -r choice
        
        # Validar que la entrada sea un número
        if ! [[ "$choice" =~ ^[0-9]+$ ]]; then
            echo -e "${RED}Error: Por favor ingresa un número válido${NC}"
            echo -e "${YELLOW}Presiona Enter para continuar...${NC}"
            read -r
            continue
        fi
        
        # Convertir a índice del array (restar 1)
        choice=$((choice-1))
        
        # Verificar que la opción esté en el rango válido
        if [ "$choice" -ge 0 ] && [ "$choice" -lt "${#week_options[@]}" ]; then
            selected_option="${week_options[choice]}"
            
            # Verificar si es la opción de volver
            if [ "$selected_option" = "⬅️ Volver al menú principal" ]; then
                return
            fi
            
            # Lanzar Jupyter Lab en la carpeta seleccionada
            launch_jupyter "$selected_option"
            
        else
            echo -e "${RED}Error: Opción inválida. Por favor selecciona un número entre 1 y ${#week_options[@]}${NC}"
            echo -e "${YELLOW}Presiona Enter para continuar...${NC}"
            read -r
        fi
    done
}

# Función para manejar el menú de homework
handle_homework_menu() {
    while true; do
        show_homework_menu
        
        # Leer la opción del usuario
        echo -n -e "${YELLOW}Ingresa tu opción (1-${#homework_options[@]}): ${NC}"
        read -r choice
        
        # Validar que la entrada sea un número
        if ! [[ "$choice" =~ ^[0-9]+$ ]]; then
            echo -e "${RED}Error: Por favor ingresa un número válido${NC}"
            echo -e "${YELLOW}Presiona Enter para continuar...${NC}"
            read -r
            continue
        fi
        
        # Convertir a índice del array (restar 1)
        choice=$((choice-1))
        
        # Verificar que la opción esté en el rango válido
        if [ "$choice" -ge 0 ] && [ "$choice" -lt "${#homework_options[@]}" ]; then
            selected_option="${homework_options[choice]}"
            
            # Verificar si es la opción de volver
            if [ "$selected_option" = "⬅️ Volver al menú principal" ]; then
                return
            fi
            
            # Lanzar Jupyter Lab en la carpeta seleccionada
            launch_jupyter "$selected_option"
            
        else
            echo -e "${RED}Error: Opción inválida. Por favor selecciona un número entre 1 y ${#homework_options[@]}${NC}"
            echo -e "${YELLOW}Presiona Enter para continuar...${NC}"
            read -r
        fi
    done
}

# Función para manejar el menú de workshops
handle_workshops_menu() {
    while true; do
        show_workshops_menu
        
        # Leer la opción del usuario
        echo -n -e "${YELLOW}Ingresa tu opción (1-${#workshop_options[@]}): ${NC}"
        read -r choice
        
        # Validar que la entrada sea un número
        if ! [[ "$choice" =~ ^[0-9]+$ ]]; then
            echo -e "${RED}Error: Por favor ingresa un número válido${NC}"
            echo -e "${YELLOW}Presiona Enter para continuar...${NC}"
            read -r
            continue
        fi
        
        # Convertir a índice del array (restar 1)
        choice=$((choice-1))
        
        # Verificar que la opción esté en el rango válido
        if [ "$choice" -ge 0 ] && [ "$choice" -lt "${#workshop_options[@]}" ]; then
            selected_option="${workshop_options[choice]}"
            
            # Verificar si es la opción de volver
            if [ "$selected_option" = "⬅️ Volver al menú principal" ]; then
                return
            fi
            
            # Lanzar Jupyter Lab en la carpeta seleccionada
            launch_jupyter "$selected_option"
            
        else
            echo -e "${RED}Error: Opción inválida. Por favor selecciona un número entre 1 y ${#workshop_options[@]}${NC}"
            echo -e "${YELLOW}Presiona Enter para continuar...${NC}"
            read -r
        fi
    done
}

# Función principal
main() {
    while true; do
        show_main_menu
        
        # Leer la opción del usuario
        echo -n -e "${YELLOW}Ingresa tu opción (1-${#main_options[@]}): ${NC}"
        read -r choice
        
        # Validar que la entrada sea un número
        if ! [[ "$choice" =~ ^[0-9]+$ ]]; then
            echo -e "${RED}Error: Por favor ingresa un número válido${NC}"
            echo -e "${YELLOW}Presiona Enter para continuar...${NC}"
            read -r
            continue
        fi
        
        # Convertir a índice del array (restar 1)
        choice=$((choice-1))
        
        # Verificar que la opción esté en el rango válido
        if [ "$choice" -ge 0 ] && [ "$choice" -lt "${#main_options[@]}" ]; then
            selected_option="${main_options[choice]}"
            
            # Verificar si es la opción de salir
            if [ "$selected_option" = "Salir" ]; then
                echo -e "${GREEN}¡Hasta luego!${NC}"
                exit 0
            fi
            
            # Verificar si es la opción de limpiar .venv
            if [ "$selected_option" = "🧹 Limpiar archivos .venv" ]; then
                cleanup_venv
                continue
            fi
            
            # Manejar submenús
            case "$selected_option" in
                "📚 Semanas (week1-week10)")
                    handle_weeks_menu
                    ;;
                "📝 Homework (homework1-homework10)")
                    handle_homework_menu
                    ;;
                "🔧 Workshops (workshop1-workshop3)")
                    handle_workshops_menu
                    ;;
            esac
            
        else
            echo -e "${RED}Error: Opción inválida. Por favor selecciona un número entre 1 y ${#main_options[@]}${NC}"
            echo -e "${YELLOW}Presiona Enter para continuar...${NC}"
            read -r
        fi
    done
}

# Verificar si estamos en el directorio correcto
if [ ! -f "README.md" ]; then
    echo -e "${RED}Error: Este script debe ejecutarse desde la raíz del proyecto ml-zoomcamp-knowledge-base${NC}"
    echo -e "${YELLOW}Directorio actual: $(pwd)${NC}"
    exit 1
fi

# Verificar si uv está instalado
if ! command -v uv &> /dev/null; then
    echo -e "${RED}Error: 'uv' no está instalado. Por favor instala uv primero.${NC}"
    echo -e "${YELLOW}Instrucciones: https://docs.astral.sh/uv/getting-started/installation/${NC}"
    exit 1
fi

# Ejecutar función principal
main
