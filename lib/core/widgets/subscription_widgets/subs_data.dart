class SubscriptionItem {
  final String imagePath;
  final String name;

  SubscriptionItem({
    required this.imagePath,
    required this.name,
  });
}


final List<SubscriptionItem> subscriptions = [
  SubscriptionItem(imagePath: 'assets/icons/cloud.svg', name: 'Disney+'),
  SubscriptionItem(imagePath: 'assets/icons/HBOGO Logo.svg', name: 'HBBO GO'),
  SubscriptionItem(imagePath: 'assets/icons/spotify.svg', name: 'Netflix'),
  SubscriptionItem(imagePath: 'assets/icons/youtube.svg', name: 'YouTube'),
  SubscriptionItem(imagePath: 'assets/icons/netflix.svg', name: 'Apple TV'),
];


