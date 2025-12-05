import React from 'react';
import { render } from '@testing-library/react-native';
import App from '../App';

// Mock FlutterView pour que Jest ne tente pas de charger le composant natif
jest.mock('../FlutterView', () => ({
  FlutterView: (props: any) => <div testID="flutter-view" {...props} />,
}));

describe('App Component', () => {
  it('renders correctly and contains FlutterView', () => {
    const { getByTestId } = render(<App />);

    // Vérifie que le container existe
    expect(getByTestId('container')).toBeTruthy();

    // Vérifie que FlutterView mocké est rendu
    expect(getByTestId('flutter-view')).toBeTruthy();
  });
});
