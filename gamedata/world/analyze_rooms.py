import os
import json

def process_room_file(file_path):
    with open(file_path, 'r') as f:
        try:
            data = json.load(f)
        except json.JSONDecodeError:
            print(f"Warning: {file_path} is not a valid JSON file. Skipping.")
            return []

    room_results = []

    # Function to process a group or base room
    def process_group(group_tiles, group_objects, group_name):
        # Count ground tiles
        ground_tiles = [tile for tile in group_tiles if "ground" in tile.get('possibleTiles', [])]
        num_ground_tiles = len(ground_tiles)

        # Count enemy spawns
        enemy_spawn_counts = {}
        for obj in group_objects:
            identifier = obj.get('identifier', '')
            if identifier.startswith('enemy_spawn'):
                enemy_spawn_counts[identifier] = enemy_spawn_counts.get(identifier, 0) + 1

        # For each enemy_spawn type, compute average per tile
        averages = {}
        for spawn_type, count in enemy_spawn_counts.items():
            if num_ground_tiles > 0:
                avg = count / num_ground_tiles
                averages[spawn_type] = avg
            else:
                averages[spawn_type] = 0

        if enemy_spawn_counts:
            room_results.append({
                'group_name': group_name,
                'num_ground_tiles': num_ground_tiles,
                'enemy_spawn_counts': enemy_spawn_counts,
                'averages': averages
            })

    # Check if there are groups
    if 'groups' in data and data['groups']:
        for idx, group in enumerate(data['groups']):
            group_name = f"Group {idx + 1}"
            group_tiles = group.get('groupTiles', [])
            group_objects = group.get('groupExtraObjects', [])
            process_group(group_tiles, group_objects, group_name)
    else:
        # Process base room
        group_name = "Base Room"
        base_tiles = data.get('baseTiles', [])
        base_objects = data.get('baseExtraObjects', [])
        process_group(base_tiles, base_objects, group_name)

    return room_results

def main():
    root_dir = '.'  # Replace with your root directory if needed

    all_results = []

    for dirpath, _, filenames in os.walk(root_dir):
        for filename in filenames:
            if filename.endswith('.room'):
                file_path = os.path.join(dirpath, filename)
                print(f"Processing file: {file_path}")
                room_results = process_room_file(file_path)
                for result in room_results:
                    all_results.append({
                        'file': file_path,
                        'group_name': result['group_name'],
                        'num_ground_tiles': result['num_ground_tiles'],
                        'enemy_spawn_counts': result['enemy_spawn_counts'],
                        'averages': result['averages']
                    })

    # Print results
    testdata = {}

    for result in all_results:
        print(f"File: {result['file']}")
        print(f"  {result['group_name']}:")

        testdata[result['file']] = {}

        print(f"    Number of ground tiles: {result['num_ground_tiles']}")
        for spawn_type, count in result['enemy_spawn_counts'].items():
            average = result['averages'][spawn_type]
            print(f"    {spawn_type}: Count = {count}, Average per tile = {average:.4f}")
            testdata[result['file']][spawn_type] = average
        print()

    print("myshit")

   # Define the group names
    group_names = ['enemy', 'corridor', 'item', 'secret', 'deadend']

    # Initialize the worlds dictionary
    worlds = {}

    # Iterate over testdata
    for key in testdata:
        # Extract the world folder from the key
        # Assuming the path format is .\[world_folder]\rooms\...
        parts = key.strip('.\\').split('\\')
        if len(parts) < 2:
            continue  # Skip if the path format is unexpected
        world_folder = parts[0]
        # Initialize the world's groups if not already present
        if world_folder not in worlds:
            worlds[world_folder] = {group: [] for group in group_names}
        # Check which group the key belongs to
        for group in group_names:
            if group in key:
                worlds[world_folder][group].append((key, testdata[key]))
                break  # Stop after first matching group

    # Now, for each world and each group, compute the averages
    for world_folder in worlds:
        print(f"\nWorld Folder: {world_folder}")
        for group in group_names:
            group_data = worlds[world_folder][group]
            if not group_data:
                continue  # Skip if no data in this group
            print(f"\nGroup: {group}")
            # Initialize sums and counts for individual spawn keys
            sums = {'enemy_spawn': 0, 'enemy_spawn_o2': 0, 'enemy_spawn_o3': 0}
            counts = {'enemy_spawn': 0, 'enemy_spawn_o2': 0, 'enemy_spawn_o3': 0}
            # Initialize general sum and count
            general_sum = 0
            general_count = 0
            # Iterate over group_data
            for key, value in group_data:
                print(f"{key}\n{value}")
                # Update sums and counts for individual spawn keys
                for spawn_key in sums.keys():
                    if spawn_key in value:
                        sums[spawn_key] += value[spawn_key]
                        counts[spawn_key] += 1
                        # Update general sum and count
                        general_sum += value[spawn_key]
                        general_count += 1
            # Calculate averages for individual spawn keys
            averages = {}
            for spawn_key in sums.keys():
                if counts[spawn_key] > 0:
                    averages[spawn_key] = sums[spawn_key] / counts[spawn_key]
                else:
                    averages[spawn_key] = None
            # Calculate general average
            if general_count > 0:
                general_average = general_sum / general_count
            else:
                general_average = None
            # Print averages
            print("\nAverages for this group:")
            for spawn_key in averages:
                if averages[spawn_key] is not None:
                    print(f"{spawn_key}: {averages[spawn_key]:.4f}")
                else:
                    print(f"{spawn_key}: No data")
            # Print general average
            if general_average is not None:
                print(f"General Average: {general_average:.4f}")
            else:
                print("General Average: No data")


if __name__ == "__main__":
    main()
