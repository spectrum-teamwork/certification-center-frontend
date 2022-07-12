<template>
  <section class="services">
    <div class="container position-relative">
      <div class="triangle" v-if="windowSize.width >= sliderArrowsBreakpoint"/>
      <div class="row">
        <div class="col-10">
          <h2 class="services__heading">Наши услуги</h2>
        </div>
        <div class="col-2">
          <csd-slider-arrows
            @prev="handleSlidePrev"
            @next="handleSlideNext"
            v-if="windowSize.width > 767 && windowSize.width < sliderArrowsBreakpoint"
          />
        </div>
      </div>
      <div class="row services__list">
        <div class="col-12">
          <div class="swiper swiper-services pb-3 pt-5 mx-n1 px-sm-3 mx-sm-n3">
            <div class="swiper-wrapper">
              <template v-for="{node} in $static.allServices.edges">
                <div class="swiper-slide d-flex align-items-stretch">
                  <csd-services-item
                    :to="node.to"
                    :name="node.name"
                    :icon="node.icon"
                    :image="node.image"
                  />
                </div>
              </template>
            </div>
          </div>
          <button
            v-if="windowSize.width >= sliderArrowsBreakpoint"
            @click="handleSlidePrev"
            class="navigation__left"
          >
            <icon-chevron-left/>
          </button>
          <button
            v-if="windowSize.width >= sliderArrowsBreakpoint"
            @click="handleSlideNext"
            class="navigation__right"
          >
            <icon-chevron-right/>
          </button>
        </div>
      </div>
      <div class="row">
        <div class="col-12">
          <csd-slider-arrows
            @prev="handleSlidePrev"
            @next="handleSlideNext"
            v-if="windowSize.width <= 767"
          />
        </div>
      </div>
    </div>
  </section>
</template>
<static-query>
query {
  allServices {
    edges {
      node {
        to
        name
        image
        icon
      }
    }
  }
}
</static-query>
<script>
import 'swiper/swiper.scss'
import Swiper from 'swiper'
import CsdServicesItem from './CsdServicesItem.vue'
import IconChevronLeft from './icons/IconChevronLeft'
import IconChevronRight from './icons/IconChevronRight'
import CsdSliderArrows from './CsdSliderArrows'
import windowSizeMixin from '../mixins/windowSizeMixin'

export default {
  name: 'CsdSectionServices',
  mixins: [windowSizeMixin],
  components: { CsdSliderArrows, IconChevronRight, IconChevronLeft, CsdServicesItem },
  data() {
    return {
      swiper: null,
      sliderArrowsBreakpoint: 1555,
      screenSizeEventListener: null
    }
  },
  methods: {
    handleSlidePrev() {
      this.swiper.slidePrev()
    },
    handleSlideNext() {
      this.swiper.slideNext()
    }
  },
  mounted() {
    this.swiper = new Swiper('.swiper-services', {
      speed: 400,
      loop: true,
      slidesPerView: 1,
      spaceBetween: 10,
      breakpoints: {
        320: {
          slidesPerView: 1,
          spaceBetween: 20
        },
        768: {
          slidesPerView: 2,
          spaceBetween: 20
        },
        992: {
          slidesPerView: 3,
          spaceBetween: 20
        },
        1400: {
          slidesPerView: 4,
          spaceBetween: 20
        }
      }
    })
  }
}
</script>