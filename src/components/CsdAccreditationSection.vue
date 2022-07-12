<template>
  <section class="accreditation">
    <div class="container">
      <div class="row">
        <div class="col-12 col-lg-4">
          <div class="accreditation__wrapper">
            <h2>Аттестаты аккредитации</h2>
            <p class="accreditation__description">
              Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
              industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and
              scrambled it to make a type specimen book.
            </p>
            <csd-slider-arrows
              @prev="handleSlidePrev"
              @next="handleSlideNext"
              :class="['ml-auto mt-auto']"
            />
          </div>
        </div>
        <div class="offset-lg-1 col-12 col-lg-7">
          <div class="swiper swiper-certificates">
            <div class="swiper-wrapper pb-1">
              <template v-for="{node} in $static.allCertificates.edges">
                <div class="swiper-slide">
                  <div class="certificate">
                    <div
                      class="certificate__image"
                      :style="{backgroundImage: `url('${node.image}')`}"
                    />
                    <p class="certificate__name">{{ node.name }}</p>
                  </div>
                </div>
              </template>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
<static-query>
query {
  allCertificates {
    edges {
      node {
        id
        alt
        name
        image
      }
    }
  }
}
</static-query>
<script>
import Swiper from 'swiper'
import 'swiper/swiper.scss'
import CsdSliderArrows from './CsdSliderArrows'
import windowSizeMixin from '../mixins/windowSizeMixin'

export default {
  name: 'CsdAccreditationSection',
  mixins: [windowSizeMixin],
  components: { CsdSliderArrows },
  data() {
    return {
      swiper: null
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
    this.swiper = new Swiper('.swiper-certificates', {
      speed: 400,
      loop: true,
      slidesPerView: 1,
      spaceBetween: 10,
      breakpoints: {
        768: {
          slidesPerView: 2,
          spaceBetween: 20
        },

        1400: {
          slidesPerView: 3,
          spaceBetween: 20
        }
      }
    })
  }
}
</script>
