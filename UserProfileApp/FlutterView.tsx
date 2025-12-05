import React from 'react';
import { requireNativeComponent } from 'react-native';

interface FlutterViewProps {
    style?: any;
}

const NativeFlutterView = requireNativeComponent<FlutterViewProps>('FlutterView');

export const FlutterView: React.FC<FlutterViewProps> = (props) => {
    return <NativeFlutterView {...props} />;
};