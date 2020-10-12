import React, { Component } from 'react';
import {
  View, Text, StyleSheet, Image, Dimensions, ScrollView, TouchableOpacity
} from 'react-native';

import global from '../../../global';

const back = require('../../../../images/appIcon/back.png');
const cart = require('../../../../images/appIcon/cartfull.png');
 
export default class ProductDetails extends Component {
  goBack() {
    const { navigator } = this.props;
    navigator.pop();
  }
  addThisProductToCart() {
    const {product} = this.props;
    global.addProductToCart(product);
  }
  render() {
    const {
      wrapper,
      cardStyle,
      header,
      footer,
      backStyle,
      imageContainer,
      cartStyle,
      textBlack,
      textSmoke,
      textHighlight,
      textMain,
      titleContainer,
      descContainer,
      productImageStyle,
      descStyle,
      txtMaterial,
      txtColor,
    } = styles;
    const {name, id, price, color, age, description, images, vaccinatedLastTime, weight, gender} = this.props.product;
    return (
      <ScrollView style={wrapper}>
        <View style={cardStyle}>
          <View style={header}>
            <TouchableOpacity onPress={this.goBack.bind(this)}>
              <Image style={backStyle} source={back} />
            </TouchableOpacity>
            <TouchableOpacity onPress={this.addThisProductToCart.bind(this)}>
              <Image style={cartStyle} source={cart} />
            </TouchableOpacity>
          </View>
          <View style={imageContainer}>
            <ScrollView style={{ flexDirection: 'row', padding: 10, height: swiperHeight }} horizontal >
              <Image 
                style={productImageStyle}
                source={{url: images[0]}} />
              <Image 
                style={productImageStyle} 
                source={{url: images[1]}} />
            </ScrollView>
          </View>
          <View style={footer}>
            <View style={titleContainer}> 
              <Text style={textMain}>
                <Text style={textBlack}>{name.toUpperCase()}</Text>
                <Text style={textHighlight}> / </Text>
                <Text style={textSmoke}>Donation amount: {price}€</Text>
              </Text>
            </View>
            <View style={descContainer}>
              <Text style={descStyle}>{description}</Text>
              <View style={{ flexDirection: 'row', justifyContent: 'space-between', paddingTop: 15 }}>
                <View style={{flexDirection: 'column'}}>
                <View style={{flexDirection: 'column'}}>
                </View>
                  <Text style={txtMaterial}>Age: {age}</Text>
                  <Text style={txtMaterial}>Weight: {weight}</Text>
                  <Text style={txtMaterial}>Gender: {gender}</Text>
                  <Text style={txtMaterial}>Vaccinated on: {vaccinatedLastTime}</Text>
                </View>
              </View>
            </View>
          </View>
        </View>
      </ScrollView>
    );
  }
}

const { width } = Dimensions.get('window');
const swiperWidth = (width / 1.8) - 30;
const swiperHeight = (swiperWidth * 452) / 361;

const styles = StyleSheet.create({
  wrapper: {
    flex: 1,
    backgroundColor: '#D6D6D6',
  },
  cardStyle: {
    flex: 1,
    backgroundColor: '#FFFFFF',
    borderRadius: 5,
    marginHorizontal: 10,
    marginVertical: 10
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    flex: 1,
    paddingHorizontal: 15,
    paddingTop: 20
  },
  cartStyle: {
    width: 25,
    height: 25
  },
  backStyle: {
    width: 25,
    height: 25
  },
  productStyle: {
    width: width / 2,
    height: width / 2
  },
  footer: {
    flex: 6
  },
  imageContainer: {
    flex: 6,
    alignItems: 'center',
    flexDirection: 'row',
    marginHorizontal: 10
  },
  textMain: {
    paddingLeft: 20,
    marginVertical: 10
  },
  textBlack: {
    fontFamily: 'Avenir',
    fontSize: 20,
    fontWeight: 'bold',
    color: '#3F3F46'
  },
  textSmoke: {
    fontFamily: 'Avenir',
    fontSize: 20,
    color: '#9A9A9A'
  },
  textHighlight: {
    fontFamily: 'Avenir',
    fontSize: 20,
    color: '#7D59C8'
  },
  titleContainer: {
    borderBottomWidth: 1,
    borderColor: '#F6F6F6',
    marginHorizontal: 20,
    paddingBottom: 5
  },
  descContainer: {
    margin: 10,
    paddingTop: 10,
    paddingHorizontal: 10,
    overflow: "visible",
  },
  descStyle: {
    color: '#AFAFAF',
  },
  linkStyle: {
    color: '#7D59C8'
  },
  productImageStyle: {
    width: swiperWidth,
    height: swiperHeight,
    marginHorizontal: 5
  },
  mainRight: {
    justifyContent: 'space-between',
    alignSelf: 'stretch',
    paddingLeft: 20
  },
  txtColor: {
    color: '#C21C70',
    fontSize: 15,
    fontWeight: '400',
    fontFamily: 'Avenir'
  },
  txtMaterial: {
    color: '#c79500',
    fontSize: 15,
    fontWeight: '600',
    fontFamily: 'Avenir'
  }
});