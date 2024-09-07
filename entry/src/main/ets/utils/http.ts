import axios, {
  AxiosInstance,
  AxiosError,
  AxiosResponse,
  InternalAxiosRequestConfig,
  AxiosRequestConfig,
} from '@ohos/axios'

const ins: AxiosInstance = axios.create({
  baseURL: 'http://192.168.71.63:6060/',
  // baseURL: 'http://172.20.10.3:6060/',
  timeout: 3000,
})
// 请求拦截器
ins.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  // config.headers
  // config.headers.token
  return config
})
// 响应拦截器
ins.interceptors.response.use(
  (response: AxiosResponse) => {
    if (response.data.code === 200) {
      console.log(JSON.stringify(response.data.data));
      return response.data
    } else {
      Promise.reject(response.data.message)
    }
  },
  (error: AxiosError) => {
    Promise.reject(error.message)
  }
)

interface IRequestOptions {
  url: string
  params?: AxiosRequestConfig['params']
  data?: AxiosRequestConfig['data']
  method?: AxiosRequestConfig['method']
  headers?: AxiosRequestConfig['headers']
}
export interface IResponse<T> {
  code: number
  message: string
  data: T
}
const http = async <T = any>({
  method,
  url,
  params,
  data,
  headers,
}: IRequestOptions): Promise<IResponse<T>> => {
  try {
      return ins.request({ method, url, params, data, headers })
  } catch (error: any) {
    console.log('HTTP ERROR', error)
    return error
  }
}
export default http
