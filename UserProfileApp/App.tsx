import React, { useState } from 'react';
import { View, Text, TextInput, Button, StyleSheet } from 'react-native';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { NavigationContainer } from '@react-navigation/native';
import { NativeModules } from 'react-native';
import { FlutterView } from './FlutterView';

const Tab = createBottomTabNavigator();
const { UserIdModule } = NativeModules;

// ✅ Onglet 1 : Entrée de l'userId (React Native)
function UserIdScreen() {
  const [userId, setUserId] = useState('');

  const handleSave = () => {
    const id = parseInt(userId, 10);
    if (!isNaN(id)) {
      UserIdModule.setUserId(id);
      alert(`UserId ${id} sauvegardé !`);
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Entrez un User ID</Text>
      <TextInput
        style={styles.input}
        placeholder="Ex: 1 ou 3"
        keyboardType="numeric"
        value={userId}
        onChangeText={setUserId}
      />
      <Button title="Sauvegarder" onPress={handleSave} />
    </View>
  );
}

// ✅ Onglet 2 : Affichage du profil (Flutter)
function ProfileScreen() {
  return (
    <View style={styles.flutterContainer}>
      <FlutterView style={styles.flutterView} />
    </View>
  );
}

export default function App() {
  return (
    <NavigationContainer>
      <Tab.Navigator>
        <Tab.Screen
          name="UserId"
          component={UserIdScreen}
          options={{ title: 'Rechercher' }}
        />
        <Tab.Screen
          name="Profile"
          component={ProfileScreen}
          options={{ title: 'Profil' }}
        />
      </Tab.Navigator>
    </NavigationContainer>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    padding: 20,
  },
  title: {
    fontSize: 20,
    marginBottom: 20,
    textAlign: 'center',
  },
  input: {
    borderWidth: 1,
    borderColor: '#ccc',
    padding: 10,
    marginBottom: 20,
    borderRadius: 5,
  },
  flutterContainer: {
    flex: 1,
  },
  flutterView: {
    flex: 1,
  },
});