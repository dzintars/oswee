class ReducerRegistry {
  _emitChange: (reducers: any) => void
  _reducers: { [key: string]: any }

  constructor() {
    this._emitChange = null
    this._reducers = {}
  }

  getReducers() {
    return { ...this._reducers }
  }

  register(name, reducer) {
    this._reducers = { ...this._reducers, [name]: reducer }
    if (this._emitChange) {
      this._emitChange(this.getReducers())
    }
  }

  setChangeListener(listener) {
    this._emitChange = listener
  }
}

const reducerRegistry = new ReducerRegistry()
export default reducerRegistry
