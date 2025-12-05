import React from 'react';
import { View, StyleSheet } from 'react-native';
import { FlutterView } from './FlutterView'; // Avec accolades

export default function App() {
  return (
    <View style={styles.container}>
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