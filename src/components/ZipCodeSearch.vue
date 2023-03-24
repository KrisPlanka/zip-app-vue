<template>
  <div class="container">
    <h1 class="text-center h1 mb-5">USA ZIP-CODE APP</h1>
    <div class="row justify-content-center">
      <div class="col-12 card p-3" style="width: 18rem">
        <div class="input-form mb-3">
      <div class="mb-3">
        <label for="zip-code" class="form-label text-dark h5">Enter your ZIP-code:</label>
        <input class="form-control" type="text" id="zip-code" v-model="zipCode" />
      </div>
      <button class="btn btn-warning" @click="fetchData">Show info</button>
    </div>

    <div v-if="results">
      <div class="text-body">
        <p class="card-text"><b>State:</b> {{ results.state }}</p>
        <p class="card-text"><b>City:</b> {{ results.city }}</p>

        <div v-if="ipData">
          <p class="card-text"><b>IP-address:</b> {{ ipData.ip }}</p>
          <p class="card-text"><b>User Agent:</b> {{ getUserAgent() }}</p>
          <p v-if="utm" class="card-text"><b>UTM:</b> {{ utm }}</p>
        </div>
      </div>
      <button class="btn btn-primary mt-3" @click="clearData">Back to home</button>
    </div>

      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      zipCode: "",
      results: null,
      ipData: null,
      utm: null,
    };
  },
  methods: {
    getUserAgent() {
      return navigator.userAgent;
    },
    clearData() {
      this.zipCode = "",
      this.results = null,
      this.ipData = null,
      this.utm = null;
    },
    getUtmParameters() {
      const queryString = window.location.search;
      const urlParams = new URLSearchParams(queryString);
      const utmParams = ['utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content'];

      const utm = {};
      utmParams.forEach((param) => {
        if (urlParams.has(param)) {
          utm[param] = urlParams.get(param);
        }
      });

      this.utm = Object.keys(utm).length > 0 ? utm : null;
      console.log(utm)
    },
    async fetchData() {
      try {
        const response = await fetch(`https://api.zippopotam.us/us/${this.zipCode}`);
        const data = await response.json();
        if (data.places && data.places.length > 0) {
          const place = data.places[0];
          this.results = {
            state: place.state,
            city: place["place name"],
          };
          this.fetchIPData();
          this.getUtmParameters();
        } else {
          this.results = null;
          alert("Failed to find data for the entered ZIP code");
        }
      } catch (error) {
        console.error("Error fetching data:", error);
        this.results = null;
      }
    },
    async fetchIPData() {
      try {
        const response = await fetch("https://ipapi.co/json/");
        const data = await response.json();
        this.ipData = {
          ip: data.ip,
          city: data.city,
          region: data.region,
          country: data.country_name,
          user_agent: data.user_agent,
        };
      } catch (error) {
        console.error("Error fetching IP data:", error);
        this.ipData = null;
        }
    },
  },
};
</script>

