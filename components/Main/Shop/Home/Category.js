import React from 'react';
import {Text, View, ImageBackground, StyleSheet, Dimensions, TouchableOpacity} from 'react-native';
import Swiper from 'react-native-swiper'

const {height, width} = Dimensions.get('window');
const url = 'http://localhost/pet-adoption-server/images/type/';

export default class Collection extends React.Component {
  gotoListProduct(category) {
    const {navigator} = this.props;
    navigator.push({name: 'PRODUCTLIST', category});
  }
  render() {
    const {types} = this.props;
    const {wrapper, image, text, cateTitle, cateWrap} = styles;
    return (
      <View style={wrapper}>
        <View style={{flex: 1, justifyContent: 'center'}}>
          <Text style={text}>CATEGORIES</Text>
        </View>
        <View style={{flex: 4}}>
          <Swiper>
            {types.map(e => (
              <TouchableOpacity
                onPress={() => this.gotoListProduct(e)}
                key={e.id}>
                <ImageBackground
                  style={image}
                  source={{url: e.image}}>
                  <View style={cateWrap}>
                    <Text style={cateTitle}>{e.name}</Text>
                  </View>
                </ImageBackground>
              </TouchableOpacity>
            ))}
          </Swiper>
        </View>
      </View>
    );
  }
}
const imageWidth = width - 40;
const imageHeight = (imageWidth / 933) * 465;
const styles = StyleSheet.create({
  wrapper: {
    borderRadius: 10,
    height: height * 0.3,
    backgroundColor: '#FFF',
    margin: 10,
    shadowColor: '#2E272B',
    shadowOffset: {width: 0, height: 3},
    shadowOpacity: 0.2,
    padding: 10,
  },
  image: {
    height: imageHeight, 
    width: imageWidth,
  },
  text: {
    fontSize: 20,
    color: '#AFAEAF',
    justifyContent: 'space-around',
  },
  cateTitle: {
    fontSize: 32,
    color: '#ffffff',
    marginRight: 70
  },
  cateWrap: {
    justifyContent: 'center',
    alignItems: 'center',
    position: 'absolute',
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
  },
});
