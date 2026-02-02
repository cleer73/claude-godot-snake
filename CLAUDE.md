# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Godot 4.5 game project using the Forward Plus renderer. GDScript is the primary scripting language.

## Godot Development

- **Engine version**: Godot 4.5
- **Project config**: `project.godot` — edit via the Godot editor UI, not directly
- **Assets**: Place in project root or subdirectories; Godot auto-imports via `.import` files
- **Scenes**: Use `.tscn` (text-based scene format) for version control friendliness
- **Generated files**: The `.godot/` directory is editor cache and is gitignored

## Architecture Conventions

- Scenes and scripts should follow Godot's node-based composition pattern
- Prefer scene inheritance and composition over deep class hierarchies
- Use signals for decoupled communication between nodes
- Autoloads (singletons) for global state and cross-scene systems
- Resources (`.tres`) for data-driven configuration

## GDScript Style

- Follow the [GDScript style guide](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html)
- Use static typing (`var x: int = 0`, `func foo() -> void:`)
- Use `@export` for inspector-exposed properties
- Use `@onready` for node references obtained at ready time
