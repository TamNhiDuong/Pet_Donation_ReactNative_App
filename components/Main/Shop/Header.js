import React, {Component} from 'react';
import {View, Text, TouchableOpacity, Dimensions, Image, TextInput, StyleSheet} from 'react-native';

import icMenu from '../../../images/appIcon/ic_menu.png';
import petlogo from '../../../images/appIcon/pet-logo2.png';

import global from '../../global';

import searchAPI from '../../../api/searchAPI';

const {height} = Dimensions.get('window');


export default class Header extends Component {
  constructor(props) {
    super(props);
    this.state = {txtInput: ''};
  }
  onSearch() {
    const {txtInput} = this.state;
    searchAPI(txtInput)
      .then(res => global.search(res))
      .catch(err => console.log(err));
    this.setState({txtInput: ''})
  }
  render() {
    const {wrapper, row1, input, icons, title, logo, slogan, headertext} = styles;
    return (
      <View style={wrapper}>
        <View style={row1}>
          <TouchableOpacity onPress={this.props.onOpen}>
            <Image source={icMenu} style={icons} />
          </TouchableOpacity>
          <View style={headertext}>
            <Text style={title}>Espoo Pet Donation</Text>
            <Text style={slogan}>1 donation feeds 1 meal for the pet</Text>
          </View>

          <Image source={petlogo} style={logo} />
        </View>
        <TextInput 
          style={input} 
          placeholder="Find your best friend here!"
          onFocus={() => global.goToSearch()}
          value={this.state.txtInput}
          onChangeText={text => this.setState({txtInput: text})} 
          onSubmitEditing={this.onSearch.bind(this)}
        />
      </View>  
    );
  }
}

const styles = StyleSheet.create({
  wrapper: {
    height: height / 6,
    backgroundColor: '#437777', 
    padding: 10,
    justifyContent: 'space-around',
  },
  row1: {flexDirection: 'row', justifyContent: 'space-between', paddingHorizontal: 20},
  input: {height: height / 27, backgroundColor: '#FFF', paddingLeft: 20},
  icons: {height: 25, width: 25},
  logo: {height: 45, width: 45},
  title: { 
    color: '#FFF',
    fontSize: 21,
    paddingTop: 28,
  },
  slogan: {
    color: '#FFF',
    fontSize: 11,
    paddingTop: 8,
    textAlign: "center"
  },
  headertext: {
    flexDirection: "column",
    textAlign: "center"
  }
});
