/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  TextInput,
  Button,
  TouchableOpacity,
  Navigator,
  View,
  Alert
} from 'react-native';

import routes from './ScreenRoutes';
import SignUpScreen from './SignUpScreen';
import UserDetailsScreen from './UserDetailsScreen';

export default class UserDetails extends Component {

  pushViews(route,navigator){
    
    if (route.index === 0)
    {
      return(
        <SignUpScreen navigator={navigator} />
      )
    }
    if(route.index === 1)
    {
      return(
        <UserDetailsScreen navigator={navigator} data={route.passProps}/>
      )
    }
  }
 
 
  render() {
    
    return(
      <Navigator
        initialRoute={routes[0]}
        initialRouteStack={routes}
        renderScene={(route, navigator) =>
          {
            return(
              this.pushViews(route,navigator)
            )
          } 
        }
      />
    );

  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
   
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('UserDetails', () => UserDetails);
