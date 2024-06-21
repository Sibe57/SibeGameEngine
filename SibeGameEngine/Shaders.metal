//
//  Shaders.metal
//  SibeGameEngine
//
//  Created by admin on 21.06.2024.
//

#include <metal_stdlib>
using namespace metal;

struct VertexIn {
    float3 position [[attribute(0)]];
    float4 color [[attribute(1)]];
};

struct RasterizationData {
    float4 position [[position]];
    float4 color;
};

vertex RasterizationData basic_vertex_shader(const VertexIn vIn [[stage_in]]) {
    RasterizationData rd;
    
    rd.position = float4(vIn.position, 1);
    rd.color = vIn.color;
    
    return rd;
}

fragment half4 basic_fragment_shader(RasterizationData rd [[stage_in]]) {
    float4 color = rd.color;
    
    return half4(color);
}
