<template>
  <div class="leave-order-form">
    <div class="container-fluid px-0">
      <div class="row">
        <div :class="{'col-10':closeable, 'col-12': !closeable}">
          <span class="leave-order-form__heading">
            Оставьте заявку
          </span>
        </div>
        <div class="col-2" v-if="closeable">
          <button class="ml-auto mt-3 button_modal-close" @click="$emit('close')">
            <icon-close/>
          </button>
        </div>
      </div>
    </div>
    <form class="form">
      <div class="container-fluid px-0">
        <div class="row">
          <div class="col-12">
            <select
              required
              name="service">
              <option disabled selected>Выберите услугу из списка</option>
              <option
                :value="node.id"
                v-for="{node} in $static.allServices.edges"
              >{{ node.name }}
              </option>
            </select>
          </div>
        </div>
        <div class="row">
          <div class="col-12 col-sm-4">
            <input
              required
              name="fullname"
              type="text"
              placeholder="Ваше имя">
          </div>
          <div class="col-12 col-sm-4">
            <input
              required
              name="tel"
              type="tel"
              placeholder="Номер телефона">
          </div>
          <div class="col-12 col-sm-4">
            <input
              required
              name="email"
              type="email"
              placeholder="E-mail">
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <textarea
              required
              name="comment"
              placeholder="Ваш комментарий"/>
          </div>
        </div>
        <div class="row mt-4 mt-lg-0">
          <div class="col-12 col-lg-8">
            <div class="checkbox-field">
              <input id="agree" type="checkbox">
              <label for="agree">Я согласен на обработку персональных данных</label>
            </div>
          </div>
          <div class="col-12 col-lg-4">
            <button class="button-submit ml-lg-auto mt-4 mt-lg-0">Отправить</button>
          </div>
        </div>
      </div>
    </form>
  </div>
</template>
<static-query>
query {
  allServices {
    edges {
      node {
        id
        name
      }
    }
  }
}
</static-query>
<script>
import IconClose from './icons/IconClose'

export default {
  name: 'CsdLeaveOrderForm',
  components: { IconClose },

  props: {
    closeable: {
      type: Boolean,
      default: false
    }
  }
}
</script>
