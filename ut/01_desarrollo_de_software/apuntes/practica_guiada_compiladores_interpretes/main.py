import json

def extract_value(obj, key):
    return obj.get(key, "")

def parse_json(data):
    results = data.get("results", [])
    for character in results:
        name = extract_value(character, "name")
        species = extract_value(character, "species")
        print(f"Nombre: {name}, Especie: {species}")

def main():
    try:
        with open('data.json', 'r') as file:
            data = json.load(file)
            parse_json(data)
    except FileNotFoundError:
        print("No se pudo abrir el archivo")
    except json.JSONDecodeError:
        print("Error al decodificar el archivo JSON")

if __name__ == "__main__":
    main()
