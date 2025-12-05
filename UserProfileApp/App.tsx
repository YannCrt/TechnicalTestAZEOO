import React from 'react';
import { View, StyleSheet } from 'react-native';
import { FlutterView } from './FlutterView';

export default function App() {
  return (
    <View testID="container" style={styles.container}> {/* Test ID pour les tests unitaires, le composant View sert à rendre le conteneur */}
      <FlutterView style={styles.flutterView} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  flutterView: {
    flex: 1,
  },
});
