List<String> parseTags(String input) {
  return input
      .split(',') // Split by commas
      .map((tag) => tag.trim()) // Trim whitespace around each tag
      .where((tag) => tag.isNotEmpty) // Remove empty tags
      .toList(); // Convert to List<String>
}
