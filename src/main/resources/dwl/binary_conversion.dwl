%dw 2.0
import * from dw::core::Binaries
output application/json
---
{
	file: toBase64(payload.value),
	filename: payload.Key
}
