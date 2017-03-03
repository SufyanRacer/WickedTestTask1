import React, { Component } from 'react';
import {
  AppRegistry,
  View,
  StyleSheet,
  Text,
  ScrollView,
  TextInput,
  Image,
  Alert,
  Dimensions,
  TouchableOpacity,
  KeyboardAvoidingView,
  Keyboard,
  TouchableHighlight
} from 'react-native';

const { width, height } = Dimensions.get('window');

import routes from './ScreenRoutes';

export default class UserDetailsScreen extends Component{

  constructor(props) {
    super(props);
    if (this.props.data) {
      this.state = {
        nametext: this.props.data.nametext,
        emailtext: this.props.data.emailtext,
        phonenumber: this.props.data.phonenumber,
        date: this.props.data.date,
        gender: this.props.data.gender,
        avatarSource: this.props.data.avatarSource === '' ? require('./images/profile.png') : this.props.data.avatarSource
      }
    }
    else{
      this.state = {
        nametext: '',
        emailtext: '',
        phonenumber: '',
        date: '',
        gender: '',
        avatarSource: ''
      };
    }
  }

  popView(){
    this.props.navigator.pop()
  }

  render() {
    let iconPath = this.state.avatarSource === '' ? require('./images/profile.png') : this.state.avatarSource
    return(
      <Image style = {styles.backgroundImage} source={require('./images/main_background.jpg')}>

        <View style={styles.backbuttonViewStyle}>
          <TouchableOpacity
            onPress={() => this.popView()} style={styles.backTouchableStyle} >
            <Text style={styles.backButtonTextStyle}>Back</Text>
          </TouchableOpacity>
        </View>

        <View style={styles.profileImageHolderView}>
          <Image source={iconPath} style = {styles.profileImageStyle}/>
        </View>

        <View style={styles.bottomContainerViewStyle}>
          <View style={styles.infoViewStyle} >
            <Text style={styles.infoViewLeftText} >Name :</Text>
            <Text style={styles.infoViewRightText} > {this.state.nametext}</Text>
          </View>
          <View style={styles.infoViewStyle} >
            <Text style={styles.infoViewLeftText} >Email :</Text>
            <Text style={styles.infoViewRightText} > {this.state.emailtext}</Text>
          </View>
          <View style={styles.infoViewStyle} >
            <Text style={styles.infoViewLeftText} >Phone Number :</Text>
            <Text style={styles.infoViewRightText} > {this.state.phonenumber}</Text>
          </View>
          <View style={styles.infoViewStyle} >
            <Text style={styles.infoViewLeftText} >Gender :</Text>
            <Text style={styles.infoViewRightText} > {this.state.gender}</Text>
          </View>
          <View style={styles.infoViewStyle} >
            <Text style={styles.infoViewLeftText} >Date of Birth :</Text>
            <Text style={styles.infoViewRightText} > {this.state.date}</Text>
          </View>
        </View>

      </Image>
    )
  }
}
const styles = StyleSheet.create({
  backgroundImage: {
    flex: 1,
    width : width,
    height: height
  },
  backbuttonViewStyle: {
    alignItems:'flex-start',
    justifyContent:'center',
    marginTop: 25,
    marginLeft: 8
  },
  backTouchableStyle: {
    alignItems:'center',
    backgroundColor: '#FFFFFF',
    width: 50,
    height:30,
    borderRadius: 5,
    justifyContent:'center'
  },
  backButtonTextStyle: {
    color: 'rgb(21,53,75)',
    fontSize: 15.0,
    fontFamily: 'Avenir-Black'
  },
  profileImageHolderView: {
    alignItems:'center',
    justifyContent:'center',
    marginTop: 0
  },
  profileImageStyle: {
    width :140,
    height: 140,
    borderRadius:70
  },
  bottomContainerViewStyle: {
    marginTop: 25,
    backgroundColor: '#FFFFFF20',
    paddingBottom: 10
  },
  infoViewStyle: {
    alignItems:'flex-start',
    justifyContent:'center',
    flexDirection: 'row',
    marginTop: 10,
    paddingRight: 5,
    paddingLeft: 5
  },
  infoViewLeftText: {
    flex: 1,
    color: '#FFFFFF',
    fontSize: 20.0,
    fontFamily: 'Avenir-Black',
    textAlign: 'right'
  },
  infoViewRightText: {
    flex: 1,
    color: '#FFFFFF',
    fontSize: 20.0,
    fontFamily: 'Avenir-Black',
    textAlign: 'left'
  }
});