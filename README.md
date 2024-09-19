# test-permission-ios

test

## Install

```bash
npm install test-permission-ios
npx cap sync
```

## API

<docgen-index>

* [`echo(...)`](#echo)
* [`isGpsEnabled()`](#isgpsenabled)
* [`requestPermissions()`](#requestpermissions)
* [`addListener('cancelAction' | 'locationStatusChange', ...)`](#addlistenercancelaction--locationstatuschange-)
* [Interfaces](#interfaces)
* [Type Aliases](#type-aliases)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### echo(...)

```typescript
echo(options: { value: string; }) => Promise<{ value: string; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ value: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### isGpsEnabled()

```typescript
isGpsEnabled() => Promise<GpsIsEnabled>
```

**Returns:** <code>Promise&lt;true&gt;</code>

--------------------


### requestPermissions()

```typescript
requestPermissions() => Promise<void>
```

--------------------


### addListener('cancelAction' | 'locationStatusChange', ...)

```typescript
addListener(eventName: 'cancelAction' | 'locationStatusChange', listenerFunc: (info: any) => any) => Promise<PluginListenerHandle>
```

| Param              | Type                                                  |
| ------------------ | ----------------------------------------------------- |
| **`eventName`**    | <code>'cancelAction' \| 'locationStatusChange'</code> |
| **`listenerFunc`** | <code>(info: any) =&gt; any</code>                    |

**Returns:** <code>Promise&lt;<a href="#pluginlistenerhandle">PluginListenerHandle</a>&gt;</code>

--------------------


### Interfaces


#### PluginListenerHandle

| Prop         | Type                                      |
| ------------ | ----------------------------------------- |
| **`remove`** | <code>() =&gt; Promise&lt;void&gt;</code> |


### Type Aliases


#### GpsIsEnabled

<code>true</code>

</docgen-api>
